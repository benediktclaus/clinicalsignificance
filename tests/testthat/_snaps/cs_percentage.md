# Results are correct

    Code
      cs_percentage(claus_2020, id, time, hamd, pre = 1, post = 4, pct_improvement = 0.5)
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:                 Percentage-based
      Percentage Improvement:   50.00%
      Percentage Deterioration: 50.00%
      Better is:                Lower
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 16 |  40.00%
      Unchanged    | 24 |  60.00%
      Deteriorated |  0 |   0.00%
      

---

    Code
      cs_percentage(claus_2020, id, time, hamd, pre = 1, post = 4, pct_improvement = 0.5,
        pct_deterioration = 0.3)
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:                 Percentage-based
      Percentage Improvement:   50.00%
      Percentage Deterioration: 30.00%
      Better is:                Lower
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 16 |  40.00%
      Unchanged    | 24 |  60.00%
      Deteriorated |  0 |   0.00%
      

