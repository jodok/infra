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
