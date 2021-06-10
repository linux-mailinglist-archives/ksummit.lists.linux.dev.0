Return-Path: <ksummit+bounces-188-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F933A34A3
	for <lists@lfdr.de>; Thu, 10 Jun 2021 22:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CA3243E1007
	for <lists@lfdr.de>; Thu, 10 Jun 2021 20:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C072FB9;
	Thu, 10 Jun 2021 20:12:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571C70
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 20:12:39 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id k11so27065957qkk.1
        for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KND7DoY/09NzlHDGlCKkV1pirvEJ2hmpAejnVKY3Dhc=;
        b=a+kj5hpoDoIiocT8sQb4ui2hitct/vz3LCP0HlE1h6aTQr3F/X6y/t5I6nME0j9QIX
         BkMnFIY3Y3zcXUGpx9lxPm62SPk6b9/C67aYWoB4kHQ3D+7VAAeNFSLICUOOGXF3iEcv
         ESIwss4AW/PpYGkSdtOfey1/zCc5sY9k/3Row=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KND7DoY/09NzlHDGlCKkV1pirvEJ2hmpAejnVKY3Dhc=;
        b=DONo/fVebuE5E7gcX/Wkn5IYAVavFt8xa8sBJZtYFu02nf7SjgQ3lw8KcmBaoEPjBW
         MyfZjYMEp8PZn0cp1DrvchHl8raKzfRPb8cR1C9hiVFfyhMFjwE8ZJAjVFFHfCK9QU0J
         SA8nq4bIzHfvp9VPOEvIVwDg5WRWLuDb9507Q5tY1AcRVyfj/k77KjzdyLYQO7so/V/D
         JIU1so+OO79BI2ri7wveRLSALxE0Oa3feofS0COJBe/M++BeHRfce+jb5LCBi8CkH5FI
         nqRFWwFBH+7FnXVPD00EQAYHtM1fdiPqMYbfzMY8HDNf39gtdq0Gn5CdjqYTouwXtIst
         TSHQ==
X-Gm-Message-State: AOAM532yta4JACE789oDOlCkUOvVgKYU4IBpKkyiQacjICIlSfUL70uI
	q1YrskdUznrWxzximjvhMJXb4g==
X-Google-Smtp-Source: ABdhPJwmGpJRpwbiikCRaxnDlsqqyl8jr1T1WEDZKeq7K9RKTwXiT2bBsg2nxY13t+OmoaiRlW9D4Q==
X-Received: by 2002:a05:620a:1113:: with SMTP id o19mr347803qkk.229.1623355958654;
        Thu, 10 Jun 2021 13:12:38 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id e128sm2890894qkd.127.2021.06.10.13.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 13:12:38 -0700 (PDT)
Date: Thu, 10 Jun 2021 16:12:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210610201236.gvxxmgl6ubjsbc3h@nitro.local>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>

(Trimming the huge CC list)

On Thu, Jun 10, 2021 at 09:39:49PM +0300, Laurent Pinchart wrote:
> The topic of how to best organize hybrid events to maximize
> inclusiveness for remote participants is more interesting to me. LPC did
> an amazing job last year with the fully remote setup, but a hybrid setup
> brings new challenges. One issue I've previously experienced in hybrid
> setups, especially for brainstorming-type discussions, was that on-site
> attendees can very quickly break out conversations in small groups (it's
> an issue for fully on-site events too).

As a (high-functioning) introvert, I'd say that a lot of it depends not so
much on the on-site/off-site nature of participation, but on individual
communication preferences. I've presented quite a bit at conferences, and, to
me, "brainstorming-type discussions" never really happen post-presentation,
largely because being in a spotlight makes me uncomfortable and I generally
try to slink away.

I suggest that something that would help is providing information on where to
ask questions in an informal setting. For example, add the following on the
last slide of your presentation:

    Thank you!

    Join the discussion:
    
    1. Mailing list: foo@lists.example.com
    2. IRC: #foochan on exampleirc.com
    3. Matrix: #foochan:example.com
    4. My email: foo@example.com

This gives enough options for folks to ask questions whether they are in the
real-life audience or attending online. Listing both your individual email and
a group chat option will help bridge many cultural divides -- some people will
feel intimidated asking a question directly (especially if you are a luminary
in your field) and will prefer to address a group. Others will feel
intimidated addressing a group (what if my question is stupid) and will prefer
to address you directly.

> Session leads should be aware of the need to ensure even more than usual
> that all speakers use microphones. I don't think we need to go as far as
> specific training on these topics, but emphasizing the importance of
> moderation would be useful in my opinion.

I think with most sessions being recorded, people are already well conditioned
to use microphones. I try to at least always repeat the question being asked
if I notice that the person asking it isn't using a mic.

> There will always be more informal discussions between on-site participants.
> After all, this is one of the benefits of conferences, by being all together
> we can easily organize ad-hoc discussions. This is traditionally done by
> finding a not too noisy corner in the conference center, would it be useful
> to have more break-out rooms with A/V equipment than usual ?

I'm generally of the opinion that we should split conferences from hackathons,
anyway.

- conferences are great for finding about cool new things happening in your
  field, and work great online where there is no limit on how many people can
  join the stream; if the presentation is not what you thought it was going to
  be, switching to a different video stream is dramatically cheaper than
  getting out of the dark room to find a different presentation.
- hackathons are great for getting things done and meeting up with folks you
  rarely get to see in real life -- and they work well as on-site, multi-site
  or hybrid events.

For example, the maintainer summit is a "hackathon", even if there is no
actual code hacking done. The thing being hackathoned is the development
process itself and general direction of things. The LinuxCon is for sure a
conference and generally has little tangible value other than a pretext to get
your employer to pay for the trip. :)

So, perhaps more frequent but smaller events around narrower topics as opposed
to huge colocated events? I do appreciate that this is more difficult for
organizers, but perhaps it would result in more tangible benefits?

-K


