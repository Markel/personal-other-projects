-- En el primer caso hay 5 peajes en las posiciones 1,4,5,7,10
-- Niveles: El array de prueba (amarillo), T_Estatica_carreters(morado), V_carreteras(azul)
(
  (
    Cont=>5,
    Ctras=>(
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>7.0, --
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.352,3.425),
          (8.329,3.291),
          (8.329,4.292),
          (9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>4.0, -- NICe
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.332,3.425),
          (7.283,3.209),
          (8.329,4.292),
          (9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>7.0, -- Nice
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.332,3.425),
          (7.283,3.209),
          (8.329,4.292),
          (-9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>7.0, -- Nice
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.352,3.425),
          (8.329,3.291),
          (8.329,4.292),
          (9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>4.0,
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.332,3.425),
          (7.283,3.209),
          (8.329,4.292),
          (9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      others=>(
        Codigo=>(others=>'z'),
        Inicio=>(others=>'z'),
        Final=>(others=>'z'),
        Peaje_km=>42.0,
        Trazado=>(Num => 0,Ptos => (others=>(100.0,100.0)))
      )
    )
  ),
  (
    Cont=>3,
    Ctras=>(
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>7.0, --
      Trazado=>(
        Num => 6,
        Ptos => (
          (5.372,2.209),
          (6.352,3.425),
          (8.329,3.291),
          (8.329,4.292),
          (9.281,2.390),
          (9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>7.0, -- Nice
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.332,3.425),
          (7.283,3.209),
          (8.329,4.292),
          (-9.281,2.390),
          others=>(100.0,100.0)
        )
      )),
      (Codigo=>(others=>'z'),
      Inicio=>(others=>'z'),
      Final=>(others=>'z'),
      Peaje_km=>4.0, -- Nice
      Trazado=>(
        Num => 5,
        Ptos => (
          (5.372,2.209),
          (6.332,3.425),
          (7.283,3.209),
          (8.329,4.292),
          (9.281,2.390),
          others=>(100.0,100.0)
        )
      )), -- 7
      others=>(
        Codigo=>(others=>'z'),
        Inicio=>(others=>'z'),
        Final=>(others=>'z'),
        Peaje_km=>42.0,
        Trazado=>(Num => 0,Ptos => (others=>(100.0,100.0)))
      )
    )
  )
);