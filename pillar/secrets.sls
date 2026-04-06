# Add secrets to this file. Sensitive secrets should be added in encrypted
# format to the ``vault`` section of the file.
# This is along https://docs.saltstack.com/en/latest/topics/pillar/index.html#pillar-encryption

# To encrypt the text ``bar`` use this command line (of course you have to
# replace the e-mail address as well):
# echo -n bar | gpg --armor --trust-model always --encrypt -r user@domain.tld
# Then paste the armored output below as a YAML block scalar (`|`).
# If your GPG frontend adds a `Comment:` header, omit that line when pasting.

secrets:
  vault:
    # Security Updates via https://updateinfo.cefs.steve-meier.de/
    # format: email:password
    cefs: |
      -----BEGIN PGP MESSAGE-----

      hQIMA7umTAYP+oroAQ/+Ng7gz3FD9n76eFhPIgSomisV3HZ+UkOHAiOD4PXv9ueX
      Nyl6Rma7ngVjKCsnX+YEuu2FdCoUWdYIIP8Gt3o5HKb7yuXWufbfm3tODvKntHuO
      4q4TZRdDGfod13hbgAAz6oQBG8AODjtM5B4DbMYp4fO0CqJQlbqfz0nqM3x4bxT2
      kMx6SlXCSn9rnmu5pgmwrN1bh1C4k6cflnI/Cjf968GezP59Mwqa3fp+nPSYe8wg
      pv7vAwDoSk4hGWG9Tb7J9fb4MxB9762znB6wJTEgnIDIfN5r2OJF7Su0LaDubuBQ
      km4yRggzW2Ymu5tqokWoExalNwz+DOKtHxXKPdYDYK0klkgFiuArmfWsZAwdTRX0
      OYyPSk181mwLENwZikjG528O56KnvzAxuvrSt7+PyugVuffHScaB4uRjA0W5nYFf
      MqOqojf6/dq5jVbcqFjT5pdk8FEwCyQ97GzZwcvSaFVLntH9vKd2MuzzoERHunau
      m7vfUmOXiCA62V3Fxia5u0RBrNtsCsOAig3qYq70CC2ZLmg8vtEeukpJHF8aZgsI
      Rt9WnxjSUd1xJ218qe2UWVTogPQ/Oi67FnUV29VdG5Xj3SNGV0OZZcidKNghTHsw
      KQPxYB3CwG8crgsnAH/CC+Gj85Qt03TdLZyw+HZiop1xmi/DTwqRhy8F8RHiL5zS
      VwF8ujwBgNsP8pNY3SOBTJSG/kRTDrlZoHoNL/mGX89NtveF+sJ+oCW5eu5tQYtc
      ugYO49OFY47gsx+ba0uZHnVoT1yIkGeBFjGQu5dlcTHnT5SVr2aynw==
      =Eo0Y
      -----END PGP MESSAGE-----
    duplicity:
      dpbx_access_token: |
        -----BEGIN PGP MESSAGE-----

        hQIMA7umTAYP+oroAQ/5AUEqxC+QJ85dwhk7KnlENYJd7QNANG42C0/OK57JL4oB
        yidGq+EPLB9RpdRTgeSfgJEC+NhrwwM/15Yadg68NddmvDncIYrplMmMzOYe7eC/
        muqtnZEoEoFJSamQmDnvrp28tkf9vw/ii1CDHddOqZKmAiVGXRh8Ui7KjklQpfF5
        CVjdeWx73gBkwf4ZkhHPvBeyoa61F9/LXoOkiT5rvyi4ONSPNDzGL4XCSQ7lguZ1
        yGmhF9ukFi/nDSk5/7vtbabkgpI6sfPTe+Bc0DCRig8eyj7mnQ6coZLxInSmKBZn
        xCogIa3e+5+RzK0YyaUfs7Wk6e1hyUqyh7QC1IGg7EZXn4bXW/B5D5oZwVmG6n3W
        7lEE625gVkMci1HRlpnlcX9Z3Rq3cW2c4si/jEDPwoJhlXJ1Jg+U08kACqWWNbSk
        lJ1M8N6vzfRHskAam8msFxYzf2EEMkCa08yv3PpunpTRMgxGRW03ipH1GC9oLUvP
        Hs6q4SH5LDlclBHRYYFRIWhIUlBiH1wM/JzL4025vaVw38bew+c8iluE1e2dIoOZ
        E+DEuRTZMN5HNlV1hOs+ETuIEos766eYQKB6X68jhT779G2S82TiJ9481xBku7T5
        BbOpLEXblneG2RHm1DT6Mv/1DzrX8z3gLd8qISYFmn3HNuZ+AEu4A1THOGSFT6vS
        dgHp9PrVncDeSPtq04pisTAHy6roW1vHRh4Exuw2pmVMqbddJaHYGoXrHANmqhYu
        a5PbEwdK1lEMt+2TW86sX5UleS0fuMUk0gYJKNMJaTJB4PKVFUfflN5qOuoUrPM5
        U7q1TxGbUrEUZaz5th1ZVlH+A4qMetk=
        =3Ln+
        -----END PGP MESSAGE-----
      passphrase: |
        -----BEGIN PGP MESSAGE-----

        hQIMA7umTAYP+oroARAAk9gvykTR2PEo59sYKrDz9gFYbNGoS6MrPoILGecfnnQv
        Xokk3XWCuMP3hvRBSTS4lRyzacRFqt8RcYkYup8p0e/BWsTEtvL46NZF8u2gjqA+
        HrV3NkS3TxMkj2VlqWBX2Cd7Vzrr4pdhuEFyqc+2+pXNmodMaX0GWijD+HAMyxTe
        jr8++ZtYKwQ5h7/QUxCX6UKQHlYSkot2W/MXdJyPaXtXnLTOLsnTp+d0KuW/hMtE
        XEq/nt5BkCzTs0py/E8R4cLaoxwNfmdQxLPft5t94t1UrrBgR09fgjZTJVMQOTNq
        yBtDV96CI5APImbmGaS7cU7/LFvcQ7cRQkoOs9O76yQLK3VpizNdHM7pzGyUOO/V
        f/E8Qfxrn63jt+9qJo1fAW5Q7CR+rVXBoWm11y3Adu/+DODivKrTtsrxH8LfGJqX
        KWLx9kuKlGVd5utFEI4oH/0zCGMAkp+ep8/re0eIco5q5TAifjNrkziVth8W3FAQ
        DD46r7vCk1rBqWJNM0Twe5fBSRoZqyTzlk0/zATzar6oO5da35Byx66E/kyz/+qi
        13LCK3qXMh5sGQ5e+nrL3anSuObgalYgAZY147qfD027dXNUcV433E9XGIDhtT72
        jJakAOfLjPPmeBN4+SmOXYIq+1PSHDYrQ2XAWb7hz52FgDf+5WPADFoCiWSeeUHS
        SwFWYomLoGenc8ubnJVXD/WqotFsY23z0CV2vW9XxQITXI2/VpO69HEZLPa3QN56
        jXmwIr0RTeivRt+Eqv+CfvsyHJgUTAYP0wG6Jg==
        =Qi9p
        -----END PGP MESSAGE-----
    cloudflare-origin-certificates:
      namche.ai.cloudflare-origin.key: |
          -----BEGIN PGP MESSAGE-----

          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
          DbgFUPvaM0lN
          =9Njs
          -----END PGP MESSAGE-----
    cloudflare:
      dns_api_tokens:
        namche.ai: |
          -----BEGIN PGP MESSAGE-----

          hQIMA5ZHxiCsLfFyARAAmMnu6e41GQj7fmAnmolaeEKMkXwDcKQInolsLv8Ode/T
          xieg8g/MjBjQcl35+eQJqYEWPlQfd3+0ydaB6SYMxj/A9LOgGP1LyTYrtL2zSz/z
          CjAbeMkhxjGt8t4wrMTSRO2PoIuIAWAwCGnlVSSMGysKkJwB0Q4iFmD7Xbptw4b+
          sp5XYZRLrfgaZG4YOYUeNg6XH/ozVEax0amwDZPyzJUdxmCViJ69wrrE/mhST+2A
          4z9h4MHk1Mo4mkKkpI1YHszikUgwO/9O6VfRts+LEpBaLohJ+sdLv24oRwvzpSsP
          rPwE0Zx5oXdzkntFSLEJcKWXt+k8EG/y2XISlJrklf9WTk9YKDDbaFZ0uorWHioc
          eZEAEzJ9tF4DIU+9eFWuFik4WTvM0axWyOiJg0IhfwXljZQkhc3P6ZmUiB6jfA+k
          wIzSNq7QmuJO13I+T+ZinEbf8BGoya2LFvwJY9yjjjsFXjqjYEq8Z9WWF473PML4
          5Dqnf2QduA9Agm/pdnnuZcKaJ+/Mi1X0PqnfbiP5C44rYQjFpeBX57lcuqGhlpHb
          eKQD24W0cBda5s2/nsYb4zbMHyMae3t2XiNllIft7Ghoi7TP5+gcsTbYk7p27nBO
          B7WqgD4TtQ4ZOBl/nZ6DEh1Bz/MAaNNXBCXMO//AIoozuZfCVKL4yzyuASQeSCbU
          egEJAhDM0izrW7DAjtgciJm8aXPTJ4zTJWpFPJsSD+Xj453jbF1RELv6RIHO37yR
          xthiVdCLoGYdNPCf+HOnnG18xtkNk3r2OKngjPS6uPQJNv4+lxt0CWAUTfNYcRRq
          0iubaat9dbgVj2xLS/LAjAk8+0o/1sZb+nhA
          =mbN4
          -----END PGP MESSAGE-----
    openclaw:
      claude_bridge:
        dashboard_pass: |
          -----BEGIN PGP MESSAGE-----
          Comment: GPGTools - http://gpgtools.org

          hQIMA5ZHxiCsLfFyAQ/9G9OZYmYJtdjwGOHvyK7XuqStm070qT9hLXXTUA6bvqtG
          uk/rAW5tal+3Ec5zCdoE9+9enxn9r9W2d6ay7zZNGhx6v1BwfQNXGT2sU9AJcsn4
          tiwto9D/UVq4GFLvFhDZhyR16lxgU5qW2ov2Ph9irrHW74sxoiTN7BuMIY/ZINqm
          iKzNbDOMmFgzmXDU9wo9GyzLEkkxgkWOafgjbhqFYdRLdtTbNelx766yJZLTPPPF
          7SM+HLdR96kwYJmfjBpN9DPEXweJciEPYjRIkUSd7dmU2hYi0SHeaG5hXYe21l9o
          ovvNZ5lvHdruZMWMSuGRPO3ij8IteDsWgGBBI7tPVXVxGq/MPhY2wSanCWEYrqJQ
          cRjAKs050BEGCEhLuOizRilTvqPKbyfivulB1yhUqOSaKVqgHLbdFpvZLuezYZQY
          1MAIp42V45iEuTovc9MvpsS/Vv8kkjuP2M/leEXQxasOhe1fbc+mQ0xVHHkpP9Vr
          SusGaMBY4vfGC+EdsXgrhQVV7x2/qtr5MpMYHFzWDLvmhqXwIsz+qTziUHSkColE
          PiwJTTWE/eVqNzawGQpbIEhFyJvQEolpsw1CIxbZ9cQkzzt4i0BfSZwE9xF5xv2s
          R50Jc8JTFa8itUGwv+0I7sUhfG8eJRrXbE5upmXgWlIOj4MKx0DoUgKWFeH9XsPU
          gAEJAhBfEXiJF3tZYY9eRbB86JKae+4oVjg6NEpUPf1nOJj7Vsizw+J88asjajlr
          ek56nQtcwl0GLHXMa/5elnnu/VTLyHUb/ydd/wcO5MSxpOQsRewJO4GAwm/xLSeY
          Oa87InXZzP+mzN7p2OYwwPaqYsyIYnoaVNpro03cuDqv
          =PzIB
          -----END PGP MESSAGE-----
    honcho:
      openai_api_key: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyAQ//cPDXmHCqQDzxS4yRLBdAQun5+0O46GaxLOX0rxyjuVKY
        TRlq7J9+b7PEaRG6pf2dybYWbKmeKFknByJdgnmM9DRvjjaAcymfdHGpPkBxkM3S
        s9BaFv4LYEFzk7LOgV4pQK04bdBXuwBeYJJ3iuFPw8C8KbiLq6I+AmXQ1rvMXcQc
        bs+AGf1aIxJ0JdkvkYnmHSvOOeavXtAtaE2oaOqj5UXFbRhgoYVx6S3WraEi7GBk
        Jwd9mwKSvSAcXuJjnPruUZTqGHlhXLcA4uFyH5NAJjvSywQqhpYs0umBFcVPdgJ3
        wMBvBrJ89mwkGXRYUFd2LmWVYFRlDpP/yy6E56oUhBvolx+nijid7qMwUAgCXP2N
        UeWIXzB9MQYOtIzVzbt3oetScT8Hrly/kiQvwa8CRergDpl5X9nA3pTDQ7bhkr+U
        wG3QjAtfla/AdDoaxL50sRkYO0YdAy3jfgg/UQ3oDGId1YWFLncz8Biuy7SMCwYA
        jFIEh6NH/0XF5HU4lkqahSkNCgCo0PeHOsOBR1qyYK21ANGCqxo7Z5X2ZVfXZgVh
        BtGP6h6fm9NApRV7mCuR8Iwan+GDh/SNmHkeyaHoRXJNdsoGd93iJYBuHz+YyuPa
        1Pz0/12LViBwe1+3A/pBbUwL9JtNnHesVB753oODXaKsdAaBMAkUIUzp0y9g78fU
        wB8BCQIQYC0habOQhdM8M9BHzbALZs2Y5qUWt4bX0z8zdo9sIR0ZwyJQN8Uofba7
        kzmMAyq27hsLi8xgStJxFfvr4I76OY8vBXCWx9HHY4QTNe8e2MJGBCpF9M7YLrJQ
        HZ5KPwBxQJzVNEE3tYtLEoqaw/kQD/tHEoq++Fy3kxMVSI1ZkQutaUBfa5qFC1xD
        qsqTMYzS9XFwpt+IxRL6U6le6GmM5d9TvwsmE9qWKHmFY43ihadaJLHJVWQQfwFq
        9OSNlXoDfcd9YcVlxER+uYhIvs3XxUtG10uLZ/egInwi
        =nYpr
        -----END PGP MESSAGE-----
      anthropic_api_key: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyAQ//cbeKy8Waa1uJ8Ogcl/u8a1FgazdeQlzCQeqTBCfe3t0O
        xluc+cnkaJLkbhXmkccJA6EEiulto8dHfME3xRk5k+Jr2L/JFffEpwydkYkkuQur
        DX6pCTCsM9uYiShOFaGLxANfixfIVLcNLM1yq1oOeQtT449lAdWBothIBri5eda3
        dCiM3Baewj1GsPmbLQMpbCNvd8udnz+8H8Ys5kRlexDFuc0P55GsSqYOEnyBdM6b
        HcYGw4/6tKwPuBDZOoD/0DuvcU32LTjA04+mTOKJPkD5jMy9GKppWDTDPh6OtUNh
        ebCwdcV65zZF1Rt127wr4ZrpxQ9vM1UMA1EuzsrWzPTlGgquCDkzjfeVDqZcOAvU
        OzRueM4un8YVoqhvDAP25AsvDuTunywmDom4UBaTJV+75mfy3eY42MCTBnxmZwlS
        F5zZNvL76o6uFWVhViyjRAcgMLd6Ih+cg08dZeEs+ROGzj77ic2UGC7oEYZV6s1U
        8MjjX1ak8kZe93XMj+4txCuvjbuvJwKrPt7hqhluYz6p18go0nf4qISrhBvHLxKq
        2nlJpkedOyJlpXF1e+uo8GWDoroDQuq2p2iKu3iCB1Mb6Btm3pgCVd0pzhI2eSia
        CdrDbWvCU4kf5XHIk6bDx6Auls71+HwQBtWXkFPMH5ZETJvVnYZZNOE4inScoxzU
        sQEJAhAAWMnHz1pgU4ETzTsFTmNYU4stpaUR5UEXtuWMkOFUmGZEJYu9wV3btqrc
        kegMtobrSJjdxLjhfgEq08VpjDa9cL9Gei+iyIRL4pVTa/qVfcZOsh+ygHRyw+oD
        upGolMz5wY6YOV/3BDJlTNTCTc8JlWcB+ZMBbErtmjp1pXV6wI7MJC12MiE2aPV4
        7MQMEHYS4LZ3inscQXnf6pWp3ei62cirVzi97b1vvUThpQ==
        =fd0y
        -----END PGP MESSAGE-----
      gemini_api_key: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyAQ/8DxaQjY7t65C0iv3Z+XKINNSLv9f7pDGENZi88XSWKHTK
        TX5XHk52UZAhkGB1I+qVtb6om7XN2JoSNYHZuZi4/iOfBQZcLHJ3Lv9++x4zW4xA
        t/FfgRz62NWCkALw4ds8EJ0DeEJbKCPdWMx+2EaNYICOhhqbggSppe5hjeOgHugC
        /MAuG82JM9e9df6l3IocxxRUIzqxBHvuDRE5GzzouPwbw5lZ6uOW5cBsAORp/G/B
        dw60OakvJVi9iDmlIpCQW9BlknGNuYaZaNNiutK1gqDjiuSNTOkWLj8taC5dNIhq
        6U0DVXxClOxI3E21KBx4GoHOMlCrWHIFtu2zXbkL8MuRrrDQqd2lWz0Z/KoRlj+U
        Zaklj53cIVFB/e83pR0LF6HZvAyW/BEfInpEiY2IV2V591fY25R3OS3/1SUgK8F2
        firLC5X3CCdKESUo3OzI3DGCUmwIVBjP2aA5dq9TBI5QQ0Os5WnPfeuwasI7bsFq
        IjFgQpEkNc17A/7ivH9qYp/JT0KN7Vp1EZNalRCvSPHvC9xfJlUEv+sCRLbKg+5y
        Q28GY5EjKzs1bEX9xY9dQy5HhWTIWhylMBM/xFpU9FDwzjE/PqyR8xD2i49msQLE
        U9jkzFwSbGuv4+nnynBq7fosY+w8j91Ks37MeTldRpkvQO8NaGhMEqEmJeyAjkzU
        bAEJAhC2DSQZMu/WDeemof1TDnjI1tVk6cSc1Rd7n8OjYatVAcsI01bbFh7iG9vR
        6gLxHZtSaJFLMvB1oWxg4Es9kZ9WMVaio/q5K15chBspk++MXdlwe5S0p+rJMWLe
        A3kpvtBJT7tcCXoMwg==
        =PIun
        -----END PGP MESSAGE-----
      groq_api_key: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyARAAmGJXOHC58aUG2kdwUZrcDGvF3qcN4Rqcsesbtxb9wgeC
        R6Y1TuuTHr5xu3yOea8cBC0Ij8KHz/rtT6Qjfaz0k/FHQzLnWuF4vMMcpKVjA+Gj
        O+DUMMMlTay2mrEk0pSRSpaaFeJTOgfKx+xywgcX1YFsqmHe5OpNpsJB1WmDegEe
        rdaCkqDjj+6TUu2Ik7xCH1lbDpyy5UQnKilIMYHb1yc7UGDvDPTKKjzIjFQmaRWh
        GcD0JBrc/JKi8Nx4F7Jk4sJxzcYqu+USA8oYYMgz+geb/248siJb5+7qsEuwzrTh
        9fWM7EsgSc5udR5v5gtxWs/p7bDZ50FEZ6lsurDHWdNVbZayL0QHyJLIIUE3QRq7
        C6nPMa+tpEzocVl2CqcSup+8hQZj0B213cvmfqE9vhNTUf3H6SS3blzy+CF+hS3W
        p7QZ06iTb6pI5qhzSo6rjyENqaaJ5zXAIKkyFsmfVnV+Bw2YK1LEMAFQXN+XDkid
        o83E2KU/UkcFsTTdXArMk45m1xqENwHeFAGka3PsVuAYXi3UbrU6YsVGFUla/XUn
        ToTlaShIxH7trm+Mdm1FfcZvupQeswCSBz3Laso66O4KQ0vC++7jbi5cUhwP20v1
        0r+zDE3rN2gvs+miXkOu2ow03m7Tv7HD1kSiY6JT3lohKQc1ptC0WHjDIIWpsXXU
        fQEJAhCk5AONsdf4tt8tMRDFvCCF+Q/PXiEqtctahC3ySRwNIaWEjnWt4LIV3CwJ
        2KHSK3pETSduAo0s9pbqUAf5WzfWwHAYajG0cqCeOIeOJjJ5TEuCuCJgs2WU1f5T
        9B0Qt/9zJ/bKUr/AM3s9+oZQnlzcZAOkkCoisgZg
        =Ftba
        -----END PGP MESSAGE-----
      db_password: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyAQ/9HrVmKiu7lANsDbg5hOKYiFnQlgCU/23tpVnvK4M7GCeY
        3OfiBRqu3P/GQ9JB8GMv8WEOhJICWnQGa8+Jzc3DllWmpsbLGhwY0NJ9BtHG2tid
        oYxab7w5+UI2JJ1JKtY8vkPVOLv20VUfq6TDBuvjDYtY5UTD+2h0vqHKxQaI3f7c
        Iw41S23FqVgg/xfeBxZXxv6UfvorSRpJuMDhiWdV9CQHaINF5Y10iUuCmiWExA7T
        1yto6MFdtI2nWqNvvvO8EYrMcAfkzv7JTrEHKDzcmAt746Vn+eKgGqwGvBBRAZ8w
        XeUVhE+kbXqNFLyAP6b2vWvVpAXdvvpowxrIwOfxu050i71ZnCnB34yPl/ji0wmC
        LrKLxfxcz+/6xTcIjlDjBPowa+SFhBkZSRag2UPJcwPFt0Snp7/eqae7bmP+Gdvu
        3jvH67j6M1QMSWOGksuRnLzLTPEo/DvwjVuqdwQpaEsVPcDeRC7M/9FnCtjDV8pw
        9fIvwILh2QUXl2q3ZVMpoJNutj47/aUbNO7GRAhRQsY++xx8ArLUd7lghjUsdjSg
        wVl/gLRsNt2xcLLAzsAJVNnzmEoNHiaQozV2h4JTKM+OFCrA3DNj3goAAtDVnMlq
        S/CN8aw5OQ1P7PwWK+spJ8tTSNlFfRewzV67i8/AT6iSfjg/B5xa05b8iXWqW7rU
        ZQEJAhCcXDBNBcor2Ol588yvFpCxU6JpIKybqdkoi8wVw0u/ADbVDLxRkcnxHcNJ
        RH6uX8wMmAU7fC988QRdfH9/sQKcmhsfDexW2neva/B5xE8UX2JRmSk5x/HEGpmg
        RUTSba3A
        =jYiQ
        -----END PGP MESSAGE-----
      jwt_secret: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyAQ//TLczY9nVwPGUVVTkL8sJLNklZJlUyyB79cnnU7fT5sSd
        raIZAbk1LaHZl7ZdzuazP9WrJjrZniOwVB56jJ8cuGNuvX8SzcXUOYJv+yN2GdFf
        DxtJFVQzMQbvLy+X6nzcigDv7pMQk9CjsxAU3o/0Qnmo7F2JyZE/R3sdAYXEbdvq
        exzDrzHHCq3CoALpGoTagMDkBnZmtuksBC5J7TwUHj3w83azHJCIPoRcL7c0MreB
        DKIPJrzbgLmBdVwemteH5cIdDlYm8mjO9PcmKHRW5VeOqAf/Sa0Cy/xMa/cBFA5x
        5B1lCsbbi+ahAOmwxIXNu1gUiDi9GlJ42knbLlVxmarbPU+98HglLzQmXxo50dQk
        RAv2B9CH7AEyP2saxvzLlBZaBr2iU0hcl+CREeWR6aqUSzBZXCAJcCO87YuWTDp2
        J2b8pVRgBYCbrDrfa2CkLa9quYupldS71XYXjmVHT4TSlXmqWbGLWK8BHAfRJF99
        fCnB8obEirfRE0kterCguu0jkaAgxZOGzfkF3lqE9udYwT1wVn5y4ohvOjOoGfks
        Z/bpcRF91Lw2jfP5wqwpijYFYXyzYg3Hp3wQJ0NmJkLp13/SKA/dj/e96Hzk89DO
        v49FUBg+dKmgL60XHMcR5GkgPa3WZcskObGmW7yr5XwOi9GsdIVsDc2cGBbVyG3U
        hQEJAhDlrqPLV7dQSB+nXeOnHot7BuQxtL2hF3fWQhnZlcmWPSRDY6VLOnSYHs56
        QJN9mzy0vKqtRBBcVVFjPSkyLTljnu3ah2xxoHhzVN6m8yQBJvSgr700eTw/6OuP
        PCbT1lFJWb3vGFtfcUxqEwW7X8dBx5ENOz0OKx4pwBHsS/NJvE4=
        =mkmS
        -----END PGP MESSAGE-----
    paperclip:
      db_password: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyARAApPgrPrI4uvxiB9y6SW3V93vsy8p1ip1YThYFHDgbJ2Us
        FUi3xcug/IjZ3DtqsnaXwKZU/hI3EHeaqpZA5Ros0Z8GcSic1z4ttqdCdzSTxmYr
        +SLvMmW5dY4W/gcSVx6Lks6WeGZ68RdqpuL0wV9rRLZp8pWee+xvPscw8RjYNBnF
        3FL/A1ZunfnA62/GD3tXrleJ+XS39QXPctyzY8lKzCTmR0O/xTUEnc2gaDDHG7K6
        kM9jYkDIs1Oj2lCzICcsI/YN32JyXCTGSiUnp1OMl6I1DQefZAtiy45Z4n/ZmGKh
        aERFFh+i7FCIVh+MSttsfh/HrALqMlh+ONbw5Glez1A2go5VA63nFMzZ241ojAGU
        0Q8s/VrNpmC6Xf+YWUvrK0rtuLgowCb1aUb6HiHczVULprMLS9Sf4RvqWrDeilnI
        Z4npuvEI5fqngo/PcwnecxVCcY5gIA1JlgSBKNHws1KxDisHCNuZNNU/mwxRk+yM
        EyRwJSCh0dXatpy/rw8OB16lod/jSY6yWcjLSVuippNLILPjjnWlR1wv/2YptkGP
        CMVxCnqT0pMaCvCienta/PqedHYX/84WNMRTZMMD97ph5GXAbVzbZp1KRIdMFXCH
        ieNxhgeooD4IYDhqioMhQT6Ah2T3/46W0GuIYdzwWXY9oVou3AJfGoHsqoUza6jU
        cgEJAhDI1dPyYXx3cUg3Yu2oVW4nHTWrLydlPnEXxPZTdwQJ9Pw9bGzFdG2S7VrP
        dQv0oOSr9dekU2ztl6EBCsXZ7hh5HwUW8+RYU42Tp4MdNdwPeJaNQsHaqLQEUiav
        W3f6aTHBRkGfy3pmdGhDkYGfPg==
        =kajr
        -----END PGP MESSAGE-----
      better_auth_secret: |
        -----BEGIN PGP MESSAGE-----
        Comment: GPGTools - http://gpgtools.org

        hQIMA5ZHxiCsLfFyAQ/+JpJ+M4fZ8uaeota20rGcInMQO9w+uBUu4Kx/qjOZX34v
        Lf3xunJpgMHtWcxCyH4MoMKr8n/rP68nAuvLw3HBqqMTkJlzkoaYBRdCQlzSUpTu
        cv+9336yHC0JOX2/LD9OBynTZvatklw6XGrDyhhkG0TLtGgNpv23E3CbZgad297+
        8wD5s168ffDFBXnBXhWuFFILFrdLYdKvlhTrmjLxM6rbNZIw1fmU/vbkRPAk4+3g
        UtsqDxyMRSlddBOYhJfGcFUk+PSWvX69sXhu2uKFp4N06yppaKjPB0YLf8cYUO0G
        jTYjO2Bs8pdBlV/CjOz3pVX2ifKtEAaAgVmtp825Wp8nQntZmE92HzqA3jB4fc7z
        KpwFsq/5tJ/19QE19HIu26agfInDngCPle+UJsqmist1vp/LStlombHEL4VMJzNz
        MdbtFMTx3An+zEX44hOq+0qL/SYs/o2wOpKfMf1kqWnA0iUH3jwP6mm2LctogKYC
        SwWBHqiOq5buRgIDTw9vUo4MVUCdOkW7fgCCSGXLFdgxiez5GI4XPEZgrFjxCcZf
        0OcMsC3npkFV69cO+pkxBoh1SieHUr+i+EkMshq4w28of6m6D77aQjGKhqT3TRMz
        zNZmORw8KNkOIZ6UjHpnvzTgXosTk0N3biEHLOL0KVHKA89aU4CQ25Tcl4gf22HU
        nAEJAhC9A301x2ki3weyI3mDkP3TgmnQ5JcDVRbTtWEhilPQFpDJJ1ErRCa8EdxF
        ZtH0FayoXmAbDJPXYO2CobDPMLnyE8q3ej/fZGIm66SEqyQiKuFgEyIhh8eIOF0v
        IKw5TH8l15ISRGf4N5qr2btRerv2ga7CZNYRFPgiH2ezEBcrLpRo1/TMqe8KUaOq
        FVmgSTAmbw6QozpDgQ==
        =nxVm
        -----END PGP MESSAGE-----
