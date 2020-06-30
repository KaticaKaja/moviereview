﻿using MovieReview.Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieReview.Application
{
    public class UseCaseExecutor
    {
        private readonly IApplicationActor actor;
        //private readonly IUseCaseLogger logger;
        public UseCaseExecutor(IApplicationActor actor/*, IUseCaseLogger logger*/)
        {
            this.actor = actor;
            //this.logger = logger;
        }

        public void ExecuteCommand<TRequest>(
            ICommand<TRequest> command,
            TRequest request)
        {
            //logger.Log(command, actor, request);
            //Console.WriteLine($"{DateTime.Now}: {actor.Identity} is trying to execute {command.Name} using data: { JsonConvert.SerializeObject(request)} ");

            if (!actor.AllowedUseCases.Contains(command.Id))
                throw new UnatuhorizedUseCaseException(command, actor);
            command.Execute(request);
        }

        public TResult ExecuteQuery<TSearch, TResult>(IQuery<TSearch, TResult> query, TSearch search)
        {
            //logger.Log(query, actor, search);
            //Console.WriteLine($"{DateTime.Now}: {actor.Identity} is trying to execute {query.Name} and get this data: { JsonConvert.SerializeObject(search)} ");

            if (!actor.AllowedUseCases.Contains(query.Id))
                throw new UnatuhorizedUseCaseException(query, actor);
            return query.Execute(search);
        }
    }
}
