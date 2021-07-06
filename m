Return-Path: <ksummit+bounces-250-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94E3BDA51
	for <lists@lfdr.de>; Tue,  6 Jul 2021 17:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D29263E0012
	for <lists@lfdr.de>; Tue,  6 Jul 2021 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54C32F80;
	Tue,  6 Jul 2021 15:36:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0335B168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 15:36:47 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b15so25640663iow.4
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wlgMwgUURXW+TTDZA6S4Idudu9EAKKfOtIGAm3Vkn+o=;
        b=tG/66vTm1JSjoG8epcT1Syr2HGvq4vovAnLLZZUH6ho++h9SOGFIM1QzonmXQNMYsH
         TNSpZJxgcSVGQv7ZtkHn7Oivx4xqtFoK+B/O1IZN8RnqnjyTh81/BMzQu8KrNKgYKjpX
         ZYN58lYq6e55lnyXVO57moJOejvJ4iS9KmBrcLXnePzCdoVUqmb+RgtU0nt3svPOybdm
         0vANkvS4RvTTJWKC8MXz9C/sEX8IFtBvPm+lJc4E9O6cJ7WqSQIdLLc3/PaocjsCSzzm
         Tss5iTsNFwjvHJAJI1o1WMnZ+Y5mLRhiHl+1QcntUieyBJ2yfFg6b05+tNRbdCOKIkM9
         kpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wlgMwgUURXW+TTDZA6S4Idudu9EAKKfOtIGAm3Vkn+o=;
        b=SO3U1jZZ2cSR6xIdFVHpnPDXi77YmiGAdm3GpaJQC4znknASEFghXG8V/MHLGmGeHv
         KFx7/FQiCKmAHdgSGc0JCzjdeEt8TOqInuVyPXKKvP6EU44nYRTUj28PQuCwKKIExWC6
         5JlcGm4Fr2ABJtssuD2eexiH1ChL8oMWoNIybEh7WriGpb5wQWegx50OwzoAGdObEE9N
         PQZfucBkPpjgbs1gI/+BZS6j1n4ZGS7VccUI1HUG6JMjQ9Qyvd+6udFPKKg+RgmIkD/i
         YZ64mlq04mcqUejq1OXp10vZO9aGEtRBW3hFIUjOTQPl2x8O8px5/NGp6ugRI5jM8q3+
         r+DA==
X-Gm-Message-State: AOAM531OMH0Y9wJeUk6uL6mqmw3qeR5q86KcqbK10iFuRYUNl6OyEooD
	9z/pxcPL0X301ZprP8B8n1/fk8Eh+ZOcUZ7mr5s=
X-Google-Smtp-Source: ABdhPJzyftLHbu360PBT++X9BbRqpz1LrH/nmZeYDyuGT8DwrQaf8+cMZAZ0+tp9/+xF2y9DjhiZ9QKO9Po805XCi0E=
X-Received: by 2002:a05:6602:2c85:: with SMTP id i5mr1280997iow.91.1625585807290;
 Tue, 06 Jul 2021 08:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
 <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com> <YORwZhbly1T9OIKw@sashalap>
In-Reply-To: <YORwZhbly1T9OIKw@sashalap>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 17:36:36 +0200
Message-ID: <CANiq72m0VtHrTodkOEGKRYxLxK5--BVTcn2hMQeXMYmmNN04eA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Sasha Levin <sashal@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 5:02 PM Sasha Levin <sashal@kernel.org> wrote:
>
> How do you see this working on the -stable side of things? It's hard
> enough to get review for C code, the amount of people who would do a
> second review in the context of a -stable release would be non-existant.

Hopefully, by the time Rust code is fixed through the -stable channel,
more people will have more knowledge on Rust.

In the worst case, we could have either the maintainers of the
abstractions review the -stable patches if they are complex enough
(but then why would they be in -stable? i.e. the same applies for any
complex C change, no?) or people with Rust knowledge looking at
-stable patches.

Cheers,
Miguel

