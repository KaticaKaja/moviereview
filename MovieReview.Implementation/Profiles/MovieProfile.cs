﻿using AutoMapper;
using MovieReview.Application.DataTransfer;
using MovieReview.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieReview.Implementation.Profiles
{
    public class MovieProfile : Profile
    {
        public MovieProfile()
        {
            CreateMap<Movie, MovieDto>()
                .ForMember(dto => dto.MovieActors, opt => opt.MapFrom(m => m.MovieActors.Select(am => new ActorMovie
                {
                    ActorId = am.ActorId,
                    MovieId = am.MovieId,
                    CharacterName = am.CharacterName

                })))
                .ForMember(dto => dto.MovieGenres, opt => opt.MapFrom(m => m.MovieGenres.Select(mg => new MovieGenre
                {
                     GenreId = mg.GenreId,
                     MovieId = mg.MovieId
                })));

            CreateMap<MovieDto, Movie>()
                .ForMember(m => m.MovieActors, opt => opt.MapFrom(dto => dto.MovieActors.Select(amdto => new ActorMovieDto
                {
                    ActorId = amdto.ActorId,
                    MovieId = amdto.MovieId,
                    CharacterName = amdto.CharacterName

                })))
                .ForMember(m => m.MovieGenres, opt => opt.MapFrom(dto => dto.MovieGenres.Select(mgdto => new MovieGenreDto
                {
                    GenreId = mgdto.GenreId,
                    MovieId = mgdto.MovieId
                })));
        }
    }
}