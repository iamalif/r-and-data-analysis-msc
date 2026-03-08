# ============================================================
# Diamonds Dataset - Final Plots
# Research Question: Does clarity drive diamond prices —
# or is size masking the truth?
# ============================================================

library(ggplot2)
library(dplyr)

data(diamonds)

# ------------------------------------------------------------
# CLEANING
# Remove rows with physically impossible dimension values
# ------------------------------------------------------------
diamonds_clean <- diamonds %>%
  filter(x > 0, y > 0, z > 0,
         y < 20, z < 20)

# Set clarity factor order: worst to best (GIA grading scale)
clarity_order <- c("I1", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF")
diamonds_clean <- diamonds_clean %>%
  mutate(clarity = factor(clarity, levels = clarity_order, ordered = TRUE))


# ============================================================
# PLOT 1 — The Misleading Headline
# Median price by clarity grade
#
# Tufte principles applied:
# P1 — zero baseline, bar length proportional to true value
# P2 — dollar values labeled directly on bars; sample sizes
#       shown below x-axis; key finding annotated on graphic
# P3 — uniform bar color, no design variation
# P5 — one variable per axis, no extra encoding dimensions
# P6 — sample sizes per grade shown so reader has full context
# ============================================================

# Compute median price and sample size per clarity grade
median_price <- diamonds_clean %>%
  group_by(clarity) %>%
  summarise(
    median_price = median(price),
    n            = n(),
    .groups      = "drop"
  )

# Build n= label for below x-axis (Tufte P6: context for the reader)
median_price <- median_price %>%
  mutate(n_label = paste0("n=", scales::comma(n)))

plot1 <- ggplot(median_price, aes(x = clarity, y = median_price)) +
  
  geom_col(fill = "#084594", width = 0.65) +
  
  # Tufte P2: price labels directly above each bar
  geom_text(aes(label = scales::dollar(median_price, accuracy = 1)),
            vjust = -0.5, size = 3.5, color = "grey30") +
  
  # Tufte P6: sample size per grade shown below x-axis labels
  # so reader knows how many diamonds back each bar
  geom_text(aes(label = n_label, y = -180),
            size = 3, color = "grey50") +
  
  # Tufte P2 + P6: direct annotation on the graphic pointing to
  # the key finding — best clarity has the lowest median price
  annotate("text",
           x     = 8,          # IF bar position
           y     = 1080 + 600, # just above the IF bar
           label = "Best clarity\nlowest median price",
           size  = 3.2,
           color = "#c0392b",
           fontface = "italic",
           hjust = 0.5) +
  
  # Arrow from annotation down toward the IF bar top
  annotate("segment",
           x    = 8, xend = 8,
           y    = 1080 + 380, yend = 1080 + 80,
           arrow = arrow(length = unit(0.15, "cm"), type = "closed"),
           color = "#c0392b", linewidth = 0.5) +
  
  # Tufte P1: zero baseline, no padding at bottom
  scale_y_continuous(
    labels = scales::dollar_format(),
    limits = c(-280, 5500),   # negative limit gives room for n= labels
    expand = c(0, 0)
  ) +
  
  labs(
    title    = "Better clarity, lower price?",
    subtitle = "Median diamond price falls as clarity improves — the finest grades appear the cheapest",
    x        = "Clarity grade (worst → best)",
    y        = "Median price (USD)"
  ) +
  
  # Tufte: minimal theme — strip all non-data ink
  theme_minimal(base_size = 13) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.3),
    plot.title         = element_text(face = "bold", size = 15),
    plot.subtitle      = element_text(color = "grey40", size = 11),
    axis.title         = element_text(color = "grey30"),
    axis.line.x        = element_line(color = "grey70", linewidth = 0.4),
    # Extra bottom margin to show n= labels without clipping
    plot.margin        = margin(t = 10, r = 10, b = 20, l = 10)
  )

print(plot1)


# ============================================================
# PLOT 3 — The Truth
# Price per carat by clarity, controlling simultaneously for:
#   Size:  0.9–1.1 carat band
#   Cut:   Ideal only
#   Color: D, E, F, G (top color range)
#
# Tufte principles applied:
# P1 — zero baseline, proportional bars
# P2 — price labels above bars; controls stated inside plot
#       area; n= shown inside bars
# P3 — uniform color, no design variation
# P5 — one variable per axis, no extra encoding
# P6 — subset size stated on graphic (1,834 of 53,917 = 3.4%)
#       so reader knows the scope of the evidence
# ============================================================

# Restrict dataset — hold all three confounders constant
narrow_band <- diamonds_clean %>%
  filter(
    carat >= 0.9, carat <= 1.1,    # hold size constant
    cut   == "Ideal",               # hold cut constant
    color %in% c("D","E","F","G")  # hold color constant
  ) %>%
  mutate(price_per_carat = price / carat)

# Total and subset sizes for P6 annotation
total_n  <- nrow(diamonds_clean)
subset_n <- nrow(narrow_band)
subset_pct <- round(subset_n / total_n * 100, 1)

# Median price per carat per clarity grade
ppc_summary <- narrow_band %>%
  group_by(clarity) %>%
  summarise(
    median_ppc = median(price_per_carat),
    n          = n(),
    .groups    = "drop"
  )

plot3 <- ggplot(ppc_summary, aes(x = clarity, y = median_ppc)) +
  
  geom_col(fill = "#084594", width = 0.65) +
  
  # Tufte P2: price per carat labeled directly above each bar
  geom_text(aes(label = scales::dollar(median_ppc, accuracy = 1)),
            vjust = -0.5, size = 3.5, color = "grey30") +
  
  # Tufte P6: sample size per bar shown inside bars
  geom_text(aes(label = paste0("n=", n), y = 250),
            size = 3, color = "white") +
  
  # Tufte P2: controls annotation placed inside plot area,
  # close to the data — not buried in a caption far from the graphic
  annotate("text",
           x        = 1,       # left-aligned near I1 bar
           y        = 12200,
           label    = "Controls: Ideal cut · Colors D–G · Carat 0.9–1.1",
           size     = 3.2,
           color    = "grey40",
           fontface = "italic",
           hjust    = 0) +
  
  # Tufte P6: state the subset scope directly on the graphic
  # so reader knows this is 3.4% of the full dataset
  annotate("text",
           x        = 1,
           y        = 11400,
           label    = paste0("Subset: ", scales::comma(subset_n),
                             " of ", scales::comma(total_n),
                             " diamonds (", subset_pct, "%)"),
           size     = 3.2,
           color    = "grey40",
           fontface = "italic",
           hjust    = 0) +
  
  # Tufte P1: zero baseline
  scale_y_continuous(
    labels = scales::dollar_format(),
    limits = c(0, 13000),
    expand = c(0, 0)
  ) +
  
  labs(
    title    = "Hold size, cut, and color constant — clarity commands a clear premium",
    subtitle = "Among comparable diamonds, IF costs ~3× more per carat than I1",
    x        = "Clarity grade (worst → best)",
    y        = "Median price per carat (USD)"
  ) +
  
  theme_minimal(base_size = 13) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.3),
    plot.title         = element_text(face = "bold", size = 15),
    plot.subtitle      = element_text(color = "grey40", size = 11),
    axis.title         = element_text(color = "grey30"),
    axis.line.x        = element_line(color = "grey70", linewidth = 0.4)
  )

print(plot3)