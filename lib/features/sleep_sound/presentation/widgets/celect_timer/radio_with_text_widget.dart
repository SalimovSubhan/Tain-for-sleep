import 'package:flutter/material.dart';

class RadioWithTextWidget extends StatelessWidget {
  final int value;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final bool isSelected;
  final bool showLeadingIcon;
  final IconData? customIcon;

  const RadioWithTextWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    required this.value,
    required this.isSelected,
    this.showLeadingIcon = false,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        highlightColor: Colors.white.withAlpha(15),
        splashColor: Colors.white.withAlpha(10),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? const Color(0xFF2563EB).withAlpha(30)
                    : const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color:
                  isSelected
                      ? const Color(0xFF2563EB).withAlpha(150)
                      : const Color(0xFF374151),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              // Иконка если есть
              if (showLeadingIcon) ...[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? const Color(0xFF2563EB).withAlpha(20)
                            : const Color(0xFF374151),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    customIcon ?? Icons.timer_outlined,
                    color:
                        isSelected
                            ? const Color(0xFF2563EB)
                            : Colors.white.withAlpha(180),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
              ],

              // Текстовый контент
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color:
                            isSelected
                                ? Colors.white
                                : Colors.white.withAlpha(220),
                        fontSize: 16,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: Colors.white.withAlpha(140),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Индикатор выбора
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelected
                            ? const Color(0xFF2563EB)
                            : Colors.white.withAlpha(120),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    width: isSelected ? 10 : 0,
                    height: isSelected ? 10 : 0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
