sol(Solution) :-
    member(Age1, [7,4,10,13]), member(Age2, [7,4,10,13]), member(Age3, [7,4,10,13]), member(Age4, [7,4,10,13]),
    Age1 \= Age2, Age1 \= Age3, Age1 \= Age4, Age2 \= Age3, Age2 \= Age4, Age3 \= Age4,

    member(Country1, [amb, ken, bas, tar]), member(Country2, [amb, ken, bas, tar]),
    member(Country3, [amb, ken, bas, tar]), member(Country4, [amb, ken, bas, tar]),
    Country1 \= Country2, Country1 \= Country3, Country1 \= Country4,
    Country2 \= Country3, Country2 \= Country4, Country3 \= Country4,

    member(Keeper1, [eva, gracie, dolly, francine]), member(Keeper2, [eva, gracie, dolly, francine]),
    member(Keeper3, [eva, gracie, dolly, francine]), member(Keeper4, [eva, gracie, dolly, francine]),
    Keeper1 \= Keeper2, Keeper1 \= Keeper3, Keeper1 \= Keeper4,
    Keeper2 \= Keeper3, Keeper2 \= Keeper4, Keeper3 \= Keeper4,

    Solution = [
        Age1-shamir-Keeper1-Country1,
        Age2-ofallo-Keeper2-Country2,
        Age3-quirrel-Keeper3-Country3,
        Age4-merah-Keeper4-Country4
    ],

    % 1. Шамиру 7 лет
    member(7-shamir-_-_, Solution),
    % 2. Шамир прибыл из Амбалата
    member(7-shamir-_-amb, Solution),
    % 3. Квиррел моложе, чем обезьяна, найденная в Таркхане
    member(AgeQ-quirrel-_-_, Solution),
    member(AgeT-_-_-tar, Solution),
    AgeQ < AgeT,

    % 4. Из Офалло и обезьяны, найденной в Таркхане, один находится под опекой Грейси, а другому — 13 лет
    ( 
        member(13-ofallo-_-_, Solution), member(_-NameTar-gracie-tar, Solution),
        NameTar \= ofallo;
        member(_-ofallo-gracie-_, Solution), member(13-NameTar-_-tar, Solution),
        NameTar \= ofallo
    ),

    % 5. Животное из Амбалата — либо десятилетнее, либо то, за которым ухаживает Франсин
    (member(10-_-_-amb, Solution); member(_-_-francine-amb, Solution)),

    % 6. Офалло не десятилетний.
    (member(AgeOf-ofallo-_-_, Solution), AgeOf \= 10),

    % 7. Обезьяна из Кендиси старше, чем та, за которой ухаживает Долли
    member(AgeK-_-_-ken, Solution),
    member(AgeD-_-dolly-_, Solution),
    AgeK > AgeD.
