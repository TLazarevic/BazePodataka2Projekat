ALTER TABLE Zaposleni DROP CONSTRAINT ckzap_zapzan;
ALTER TABLE zaposleni
    ADD CONSTRAINT ckzap_zapzan CHECK ( zapzan IN (
        'Astronaut',
        'Pilot',
        'Inzenjer',
        'Rukovodilac',
        'Lekar',
        'Uprljudres'
    ) );
