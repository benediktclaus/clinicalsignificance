# All arguments are set correctly

    Argument `id` is missing with no default. A column containing patient-specific IDs must be supplied.

---

    Argument `time` is missing with no default. A column identifying the individual measurements must be supplied.

---

    Argument `outcome` is missing with no default. A column containing the outcome must be supplied.

---

    `reliability` must be numeric but a `character` was supplied.

---

    `reliability` must be between 0 and 1 but 1.1 was supplied.

---

    `reliability` must be between 0 and 1 but -0.8 was supplied.

# Results are correct

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        rci_method = "JT")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: JT
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 29 |  72.50%
      Unchanged    | 10 |  25.00%
      Deteriorated |  1 |   2.50%
      

---

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        rci_method = "EN")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: EN
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 32 |  80.00%
      Unchanged    |  5 |  12.50%
      Deteriorated |  3 |   7.50%
      

---

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        rci_method = "HLL")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: HLL
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 12 |  30.00%
      Unchanged    | 16 |  40.00%
      Deteriorated | 12 |  30.00%
      

---

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        rci_method = "GLN")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: GLN
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 29 |  72.50%
      Unchanged    | 10 |  25.00%
      Deteriorated |  1 |   2.50%
      

---

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        reliability_post = 0.5, rci_method = "NK")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: NK
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 28 |  70.00%
      Unchanged    | 11 |  27.50%
      Deteriorated |  1 |   2.50%
      

---

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        rci_method = "HA")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: HA
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 32 |  80.00%
      Unchanged    |  7 |  17.50%
      Deteriorated |  1 |   2.50%
      

---

    Code
      cs_distribution(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        rci_method = "HLM")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:   Distribution-based
      RCI Method: HLM
      
      Category     |  N | Percent
      ---------------------------
      Improved     | 11 |  27.50%
      Unchanged    | 20 |  50.00%
      Deteriorated |  9 |  22.50%
      

