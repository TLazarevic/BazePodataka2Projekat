ALTER TABLE Zaposleni DROP CONSTRAINT ckzaposleni_zapzan;
ALTER TABLE zaposleni
    ADD CONSTRAINT ckzaposleni_zapzan CHECK ( zapzan IN (
        'Astronaut',
        'Pilot',
        'Inzenjer',
        'Rukovodilac',
        'Lekar',
        'Uprljudres'
    ) );
