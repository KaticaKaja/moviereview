﻿using MovieReview.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieReview.Application.Commands
{
    public interface IUpdateActor : ICommand<ActorDto>
    {
    }
}
