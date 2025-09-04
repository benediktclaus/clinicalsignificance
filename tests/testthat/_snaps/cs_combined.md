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
      cs_combined(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        m_functional = 8, sd_functional = 8, cutoff_type = "c", rci_method = "JT")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    JT
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 26 |  65.00%
      Improved     |  3 |   7.50%
      Unchanged    | 10 |  25.00%
      Deteriorated |  1 |   2.50%
      Harmed       |  0 |   0.00%
      

---

    Code
      cs_combined(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        m_functional = 8, sd_functional = 8, cutoff_type = "c", rci_method = "EN")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    EN
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 26 |  65.00%
      Improved     |  6 |  15.00%
      Unchanged    |  5 |  12.50%
      Deteriorated |  3 |   7.50%
      Harmed       |  0 |   0.00%
      

---

    Code
      cs_combined(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        m_functional = 8, sd_functional = 8, cutoff_type = "c", rci_method = "HLL")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    HLL
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 12 |  30.00%
      Improved     |  0 |   0.00%
      Unchanged    | 16 |  40.00%
      Deteriorated | 11 |  27.50%
      Harmed       |  1 |   2.50%
      

---

    Code
      cs_combined(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        m_functional = 8, sd_functional = 8, cutoff_type = "c", rci_method = "GLN")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    GLN
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 26 |  65.00%
      Improved     |  3 |   7.50%
      Unchanged    | 10 |  25.00%
      Deteriorated |  1 |   2.50%
      Harmed       |  0 |   0.00%
      

---

    Code
      cs_combined(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        m_functional = 8, sd_functional = 8, cutoff_type = "c", reliability_post = 0.5,
        rci_method = "NK")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    NK
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 26 |  65.00%
      Improved     |  2 |   5.00%
      Unchanged    | 11 |  27.50%
      Deteriorated |  1 |   2.50%
      Harmed       |  0 |   0.00%
      

---

    Code
      cs_combined(claus_2020, id, time, hamd, pre = 1, post = 4, reliability = 0.8,
        m_functional = 8, sd_functional = 8, cutoff_type = "c", rci_method = "HA")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    HA
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 23 |  57.50%
      Improved     |  9 |  22.50%
      Unchanged    |  7 |  17.50%
      Deteriorated |  1 |   2.50%
      Harmed       |  0 |   0.00%
      
      
      Group Level Summary
      
      Category   | Percent
      --------------------
      Changed    |  90.31%
      Functional |  75.55%
      

---

    Code
      cs_combined(claus_2020, id, time, hamd, m_functional = 8, sd_functional = 8,
        cutoff_type = "c", rci_method = "HLM")
    Output
      
      ---- Clinical Significance Results ----
      
      Approach:  Combined
      Method:    HLM
      Better is: Lower
      
      Category     |  N | Percent
      ---------------------------
      Recovered    | 10 |  25.00%
      Improved     |  1 |   2.50%
      Unchanged    | 20 |  50.00%
      Deteriorated |  9 |  22.50%
      Harmed       |  0 |   0.00%
      

