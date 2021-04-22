Return-Path: <ksummit+bounces-68-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7B368168
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 815213E506B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2782FA1;
	Thu, 22 Apr 2021 13:24:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226452F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:24:04 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id 18so20307719qtz.6
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jAOO4VAV1jOfvYa8t+p7usPzA5IknEn+h/Odnf7ePbU=;
        b=TeT4VGRGY822WQbhnFGe3vB4OX2XjZrvwmsGa86lY5Lowp/l9W8GCr6k3Y+9ynrmbB
         lxdkhjySb67Cw77tSGzh2gamdkkKPAo2Y3PxV+iRQm3CqdcYTMvmZ5dHkHzAs5wVaWQy
         0W0JTqYwIyVDj1AdY/Rf8DDtuLLaXHuUrVX/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jAOO4VAV1jOfvYa8t+p7usPzA5IknEn+h/Odnf7ePbU=;
        b=M7BfCeqNqNA3GLIv7RK7RuppYUizp8vza1PdSLFgs84pjRPlJL9RbHwdQoTcAZWQxO
         QSpteu34eawSJSjBWPF7eaRJoyfxZLlh4mWFwNPVTbtsVheZcTqWTw3mjzVKtASf5fTC
         Tt3WDHW8N0cIJTLYuMJuOt43gMprvsN7oieMILZDROdE8Cz8XO3MBC9aLKcArPSbGBiz
         LaeOlu2eFyL1UZwe9lu5MXa9tsCK5Ar1lOWjPhV/ltqZ1KUwzCpKuNsmCOtfbrLuUGQw
         K1lqeOxRMknnjcW0yo7bhdqiJQw6oxYirtMUuXrWIm34If22dVbGURWKetrA24fFHwpA
         scag==
X-Gm-Message-State: AOAM533iKCjEWL2lzDvgz82dYDylHFLA7MJppCFm0QHGqRzEYX77585Z
	tM2Yadh01jgd2rpf50mTgsHdRV+4Gr/HO6iw
X-Google-Smtp-Source: ABdhPJw80bucCyph+YO/qW1Rdn6KFKdJq5zJfPZCxxjvxre0D5IQzSp4bj2qIb7yLdLvrn1Ldbl6MA==
X-Received: by 2002:ac8:5f10:: with SMTP id x16mr3227807qta.6.1619097842908;
        Thu, 22 Apr 2021 06:24:02 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id c5sm2067280qkl.7.2021.04.22.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:24:02 -0700 (PDT)
Date: Thu, 22 Apr 2021 09:24:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422132401.grykyup37xdz3yly@nitro.local>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210422123559.1dc647fb@coco.lan>

On Thu, Apr 22, 2021 at 12:35:59PM +0200, Mauro Carvalho Chehab wrote:
> I mean, usually, each maintainer develops internally a "trust score"
> from subsystem's contributors, but such trustee level is usually not
> shared with other maintainers.
> 
> When a developer reaches a certain level, maintainers are willing
> to merge their work faster as they know that the developer is
> there for a while and it is not trying to harm the community.

> 
> Perhaps one thing that we could add would be a
> scripts/get_developer_trustee_status, which would be returning
> a set of indicators that would help the maintainer to know
> how much it can trust a random contributor, like:
> 
> 	- how many drivers and patches a contributor has written;
> 	- how long and how frequent he's sending Kernel patches;
> 	- what subsystems received patches from him;
> 	- if the developer isn't on a blacklist/graylist.

I must point out that "karma" systems are quite ripe for abuse and can create
negative dynamics within the project. Right now, without an accepted framework
of cryptographic patch attestation, high-karma accounts will be more likely to
be targeted for impersonation -- typo spoofing, account hijacking, "From"
fudging [*], etc.

Even if we do everything right and implement strong cryptographic end-to-end
attestation, we will still always have to assume that the submitter might be
under duress and is submitting intentionally harmful code because someone is
holding their family hostage.

I think karma makes sense within the vertical confines of submaintainer
hierarchy -- X collects patches and sends a pull request to Y; Y verifies the
signature on the pull request, gives it a quick review and submits another
request to Z, etc. Exporting the "karma points" outside of this hierarchy
doesn't really make sense.

-K

[*] A neat trick is where the email message "From" is a random gmail address,
but the in-body "From:" has an address of a trusted contributor. If you review
such patches after running "git am" you will not catch this discrepancy.

