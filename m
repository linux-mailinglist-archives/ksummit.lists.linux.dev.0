Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E07E750D
	for <lists@lfdr.de>; Fri, 10 Nov 2023 00:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDB49B210F0
	for <lists@lfdr.de>; Thu,  9 Nov 2023 23:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B9538DE9;
	Thu,  9 Nov 2023 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KqdnCuFx"
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980C38DC5
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b5714439b3so799873b6e.3
        for <ksummit@lists.linux.dev>; Thu, 09 Nov 2023 15:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1699571795; x=1700176595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0CekuO8GOG3G9TbqNJGKThOQYWpklnfL3NOaSRYJAk=;
        b=KqdnCuFxuw5ToP4qTyzVRDG2IuLiNYYYxaT9IjjVMolH/NWUZHUTIE36aAlwznUflj
         LckpXXY9myYbgteUtZ1PPL73ULC6yImqDTZfcKOuic3b68D6yOZfJK98VJVOcrteleAy
         KuS2Drta8pMavZNPWbtyaQdgemvuE8wGWGTscJA93e35Oeki1gMprUt0H6tT0W0NWs3Z
         RV4D/Iavewa6dmNYPUtAPeB4PK+jYZcTLc5jwMAw2b7SL7+towHTfyU3F5zNr22+IJQ3
         lSR42ZPBoY2tRbxmWeC8DUsMRBOXXDjgSgrdpjpVGCMvbQ2voatvNAk5l/xJlwEeGWp/
         zzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699571795; x=1700176595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0CekuO8GOG3G9TbqNJGKThOQYWpklnfL3NOaSRYJAk=;
        b=PXjwqBBgmufWceG8ShXY4rbbyS98x+mp8o6QhpuJfRsyrUVDQKqUEuRcuHrFUaA1qU
         7LcAAnz3amzabK5Jpp96Dl5cx5/Mlx/2+5Pgw2c+Wgt0uSeCq88i8N0aeyUF8ZLuu4T4
         y6YKORTNusnP9ij79qMWCVtuBLxowUxJpt1R/EGrN8RhT0ZlA7qV0Ymys2Cb1RQYf8Ej
         0WpPbeAVHMQuGk15abRR/jdfTzdrCeTWSdx4zJJl3NwNb97/MYNtgczcCqjocCPWHH5m
         KNX+8BTwDxZ69vMr+oxPc/ouZO46zYCWO+tGv6GFQzGqYupwfggR3bbSuBRF3kWYD8jB
         uAmw==
X-Gm-Message-State: AOJu0YzmkFtT4HALEuolhGYm9qlZyt7lSaZe2Il+Sg+Jpcf3zDDgYJEJ
	Gpua5fzst78aWkI9PC2IIpXf7Q==
X-Google-Smtp-Source: AGHT+IHJkOD1NH1fIh/fMxXjesZ3qjtgOwQniGMnxx6Jl9JFoaGs55SWkds52fvUZGmmMBWum9Dkmg==
X-Received: by 2002:aca:f03:0:b0:3a7:4161:44ee with SMTP id 3-20020aca0f03000000b003a7416144eemr3100869oip.6.1699571794958;
        Thu, 09 Nov 2023 15:16:34 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id bf41-20020a056808192900b003b2f369a932sm136685oib.49.2023.11.09.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 15:16:34 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1r1EGH-001rCC-2V;
	Thu, 09 Nov 2023 19:16:33 -0400
Date: Thu, 9 Nov 2023 19:16:33 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Alex Elder <elder@ieee.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mark Brown <broonie@kernel.org>, users@linux.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109231633.GI4634@ziepe.ca>
References: <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com>
 <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
 <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
 <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
 <20231109-soft-anaconda-of-passion-5157c7@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109-soft-anaconda-of-passion-5157c7@nitro>

On Thu, Nov 09, 2023 at 02:38:58PM -0500, Konstantin Ryabitsev wrote:
> On Thu, Nov 09, 2023 at 11:11:08AM -0800, Joe Perches wrote:
> > > > My input is that whatever the outcome of all this discussion, please
> > > > define it as policy and have get_maintainer.pl implement it.  I don't
> > > > want to have to think too hard about who *should* be included (beyond
> > > > people I already know).
> > > 
> > > Yes, I fully agree with you -- people shouldn't need to know where the patches
> > > should be going. The tooling should decide this for them, and I want to change
> > > the tooling so that it no longer includes linux-kernel@vger on everything,
> > > only on patches without any other mailing list matches.
> > 
> > Relatively easy to do, but what about your original request/suggestion
> > to use patches@lists.linux.dev ?
> 
> Happy to go that route, just need to get the buy-in from everyone, which I
> intend to bring up at the maintainers summit. My proposed course of action
> is:
> 
> 1. Update get_maintainer.pl so that linux-kernel@vger.kernel.org is no longer
>    added on "THE REST" fall-through, unless there are no other L: entries that
>    matched.
> 2. Add functionality to public-inbox to provide RSS feeds for "new topics" and
>    "hot topics" that would allow following individual lists and the /all/
>    aggregator. This is under discussion on the public-inbox meta list [1], so
>    there is no final decision on this being included.
> 3. Figure out the best way to specify the "always-cc" address that should be
>    always included by get_maintainer, either via MAINTAINERS, or via some kind
>    of dot-file. Maybe just have this in MAINTAINERS:
> 
>    ALWAYS CC
>    L: patches@lists.linux.dev

Is it possible you could do this on the backend and automatically
route all patches send to any mailing list to this list?

> I think this should gradually improve the linux-kernel mailing list to the
> point where most people will start reading it again.

From what I understood of this discussion the people who were using it
actually did seem to want the entire firehose of email? Removing
traffic from linux-kernel seems like the opposite of that?

How about getting people to move to an actual fire hose and then
scaling back linux-kernel until it can be retired? You were talking
about a flexible POP3 service or something...

Personally I've been using lei along with the "dfn" search. It seems
to work OK. Though lei itself is a bit of a bear.

It would be neat to be able to get some more targetted things like a
query that matches all pull request to Linus, for instance. That would
be an interesting virtual mailing list to read to keep aware of
things.

I don't know if it has been said enough but the entire lore
infrastructure has been very transformative for how, at least I,
work. It is fantastic having a reliable and robust archive.

Jason

