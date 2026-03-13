import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';

class SlideToOrderBar extends StatefulWidget {
  final double price;
  final VoidCallback onConfirmed;

  const SlideToOrderBar({
    super.key,
    required this.price,
    required this.onConfirmed,
  });

  @override
  State<SlideToOrderBar> createState() => _SlideToOrderBarState();
}

class _SlideToOrderBarState extends State<SlideToOrderBar>
    with SingleTickerProviderStateMixin {
  double _dragFraction = 0.0;
  bool _confirmed = false;
  late AnimationController _snapController;
  late Animation<double> _snapAnimation;

  @override
  void initState() {
    super.initState();
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _snapController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details, double maxThumbTravel) {
    if (_confirmed) return;
    final newFraction =
        (_dragFraction + details.delta.dx / maxThumbTravel).clamp(0.0, 1.0);
    setState(() => _dragFraction = newFraction);
    if (_dragFraction >= 0.95) {
      _onConfirm();
    }
  }

  void _onDragEnd(DragEndDetails _) {
    if (_confirmed) return;
    final startFraction = _dragFraction;
    _snapAnimation = Tween<double>(begin: startFraction, end: 0.0).animate(
      CurvedAnimation(parent: _snapController, curve: Curves.elasticOut),
    )..addListener(() => setState(() => _dragFraction = _snapAnimation.value));
    _snapController.forward(from: 0);
  }

  void _onConfirm() {
    if (_confirmed) return;
    setState(() {
      _confirmed = true;
      _dragFraction = 1.0;
    });
    HapticFeedback.heavyImpact();
    widget.onConfirmed();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _confirmed = false;
          _dragFraction = 0.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _PriceColumn(price: widget.price),
          SizedBox(width: 20.w),
          Expanded(
            child: _SlideTrack(
              dragFraction: _dragFraction,
              confirmed: _confirmed,
              onDragUpdate: _onDragUpdate,
              onDragEnd: _onDragEnd,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceColumn extends StatelessWidget {
  final double price;

  const _PriceColumn({required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.gold, AppColors.peach],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: Text(
            '${price.toStringAsFixed(2)} JD',
            style: AppTextStyles.font22.copyWith(color: AppColors.white),
          ),
        ),
        Text(
          '+ tax & service',
          style: AppTextStyles.font15.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}

class _SlideTrack extends StatelessWidget {
  final double dragFraction;
  final bool confirmed;
  final void Function(DragUpdateDetails, double) onDragUpdate;
  final void Function(DragEndDetails) onDragEnd;

  const _SlideTrack({
    required this.dragFraction,
    required this.confirmed,
    required this.onDragUpdate,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    final trackHeight = 65.r;
    final thumbSize = trackHeight - 12.r; 

    return LayoutBuilder(builder: (context, constraints) {
      final trackWidth = constraints.maxWidth;
      final maxThumbTravel = trackWidth - thumbSize - 12.r; 
      final thumbOffset = dragFraction * maxThumbTravel;
      final progress = dragFraction;

      return GestureDetector(
        onHorizontalDragUpdate: (d) => onDragUpdate(d, maxThumbTravel),
        onHorizontalDragEnd: onDragEnd,
        child: Container(
          height: trackHeight,
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(trackHeight / 2),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Stack(
            children: [
              _FillBar(
                progress: progress,
                trackHeight: trackHeight,
              ),
              _TrackLabel(
                progress: progress,
                confirmed: confirmed,
              ),
              if (confirmed)
                Center(
                  child: Icon(Icons.check_rounded, color: AppColors.black, size: 24.sp),
                ),
              _SlideThumb(
                offset: thumbOffset + 6.r, 
                trackHeight: trackHeight,
                thumbSize: thumbSize,
                confirmed: confirmed,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _FillBar extends StatelessWidget {
  final double progress;
  final double trackHeight;

  const _FillBar({required this.progress, required this.trackHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(trackHeight / 2),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.gold, AppColors.peach],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(trackHeight / 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TrackLabel extends StatelessWidget {
  final double progress;
  final bool confirmed;

  const _TrackLabel({required this.progress, required this.confirmed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: confirmed ? 0.0 : (1.0 - progress * 2).clamp(0.0, 1.0),
        duration: const Duration(milliseconds: 100),
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.gold, AppColors.peach],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: Text(
            'Slide to Order',
            style: AppTextStyles.font12.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _SlideThumb extends StatelessWidget {
  final double offset;
  final double trackHeight;
  final double thumbSize;
  final bool confirmed;

  const _SlideThumb({
    required this.offset,
    required this.trackHeight,
    required this.thumbSize,
    required this.confirmed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset,
      top: (trackHeight - thumbSize) / 2,
      child: Container(
        width: thumbSize,
        height: thumbSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [AppColors.gold, AppColors.peach],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.35),
              blurRadius: 12.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Icon(
          confirmed ? Icons.check_rounded : Icons.chevron_right_rounded,
          color: AppColors.black,
          size: 26.sp,
        ),
      ),
    );
  }
}
