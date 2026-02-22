# Add secrets to this file. Sensitive secrets should be added in encrypted
# format to the ``vault`` section of the file.
# This is along https://docs.saltstack.com/en/latest/topics/pillar/index.html#pillar-encryption

# to encrypt the text ``bar`` use this commandline (of course you have to replace
# the e-mail adress as well):
# echo -n bar | gpg --armor --trust-model always --encrypt -r user@domain.tld | sed ':a;N;$!ba;s/\n/\\n/g'

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
      namche:
        key: |
          -----BEGIN PGP MESSAGE-----

          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
          DbgFUPvaM0lN
          =9Njs
          -----END PGP MESSAGE-----        
