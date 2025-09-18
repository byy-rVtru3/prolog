% sol(-Solution)
% Solution — список четверок вида Возраст-Имя-Смотритель-Страна

sol(Solution) :-
    % Возможные возраста, имена, смотрители и страны
    Names = [shamir, ofallo, quirrel, merah],
    Keepers = [eva, gracie, dolly, francine],
    Countries = [amb, ken, bas, tar],

    % Формируем список четверок
    permutation([
        4-Name1-Keeper1-Country1,
        7-Name2-Keeper2-Country2,
        10-Name3-Keeper3-Country3,
        13-Name4-Keeper4-Country4
    ], Solution),

    % Условие: все имена различны
    permutation(Names, [Name1,Name2,Name3,Name4]),
    % Условие: все смотрители различны
    permutation(Keepers, [Keeper1,Keeper2,Keeper3,Keeper4]),
    % Условие: все страны различны
    permutation(Countries, [Country1,Country2,Country3,Country4]),

    % Подсказка 1: Шамиру 7 лет
    member(7-shamir-_-_, Solution),

    % Подсказка 2: Шамир прибыл из Амбалата
    member(_-shamir-_-amb, Solution),

    % Подсказка 3: Квиррел моложе, чем обезьяна из Таркхана
    member(AgeQ-quirrel-_-_, Solution),
    member(AgeT-_-_-tar, Solution),
    AgeQ < AgeT,

    % Подсказка 4: из Офалло и из Таркхана:
    % один под опекой Грейси, другому — 13 лет
    member(AgeO-ofallo-KeeperO-_, Solution),
    member(AgeT2-_-KeeperT2-tar, Solution),
    (
        (KeeperO = gracie, AgeT2 = 13);
        (KeeperT2 = gracie, AgeO = 13)
    ),

    % Подсказка 5: Животное из Амбалата —
    % либо десятилетнее, либо то, за которым ухаживает Франсин
    (member(10-_-_-amb, Solution);
     member(_-_-francine-amb, Solution)),

    % Подсказка 6: Офалло не десятилетний
    \+ member(10-ofallo-_-_, Solution),

    % Подсказка 7: Обезьяна из Кендиси старше,
    % чем та, за которой ухаживает Долли
    member(AgeK-_-_-ken, Solution),
    member(AgeD-_-dolly-_, Solution),
    AgeK > AgeD,

    !. % Чтобы был только один ответ
