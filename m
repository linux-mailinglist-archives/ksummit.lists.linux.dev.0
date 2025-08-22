Return-Path: <ksummit+bounces-2206-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBEB3172A
	for <lists@lfdr.de>; Fri, 22 Aug 2025 14:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D37161D20ABD
	for <lists@lfdr.de>; Fri, 22 Aug 2025 12:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B342FE585;
	Fri, 22 Aug 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3A1X3YU"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD425BEF2
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864506; cv=none; b=JI0r792h7jBidRb2GMxdHmwOs+PSJ3H7DqaZv15RuoWH4EqNhmfPu65tA6F9DjEm2CB4Un/LWljXhgU1IS/RoGrl586crpyEqYru0haUZFqRKwHWV9L6NyeEKq5rpKHiQ9sxbFndmdDYeFPbXb+k31kV0/vOz/FTeYK7xR9T2cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864506; c=relaxed/simple;
	bh=icvOVLayDoSIGz97Y+5vuiiZEPJXTkrBBBS+axzZtV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeSzqfwUagYzwNaIGYT9epmFuD2m5ccjND10yWtK2iYY8Yx31KB3OjgyVvySEoIHTQ6k7XmO3H4XXHnFvsaxwX55JM3bvmVx1CtR0GwXsttSvREoybeORtMreEP0erPCRnPmytkRS9Js/xLnpAuLUsPPBo0l2o0BPw+wjC+z7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3A1X3YU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03886C116B1
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755864506;
	bh=icvOVLayDoSIGz97Y+5vuiiZEPJXTkrBBBS+axzZtV8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N3A1X3YUvtLFuai+gK84RVzN2aHLtRYyGvQyRYANnfXHhd9w4GdICP5xylCh733Sq
	 qoQ200CDAxiNp+fpypjfSRWnscwc6kbLX7U9Zpfpfv0G8gvUx9ufmKKOEpY42D5JvG
	 HKkhtRDo6rHhikqblXqtXpvaxRyQRMHNbm0qFzxG0bZ9nNsUUAGVRCrHYUkl88aCY2
	 BpgsS58RsBWiqaWfcon06jPtXtsfaVaTKi1WgLWf2qpueycsnOHFEtO3W9YfFbbn81
	 uQjDyj1IWG5nU1e9Tkp5NZxy4tNAGH1DZF2nT4j20HDj0NeNLUkgoC9LCRH6c32lVq
	 cANBnOkUboqUw==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3111c59720dso1083230fac.1
        for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 05:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzgQeu281TwezhQGckWl7yWagg3sdCUZMLDqYZizBqoI9EyJ/m8Vf5XfPpFmeMdF7ckMS92fy3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5UtgNxeilLlMdORx2/0BD4FRm7ZAxkE3/gtx5fRKINOh8K8sZ
	tiYK7nABBLQZcXqRuLPdoixCtfjz3kgtgj8is9XMJxvmbH4PEA/u+t+aXyxlXJcF07zDAAXuXZO
	Nj0IMXytmQfvSyji+7xZsaErtyHKl2HI=
X-Google-Smtp-Source: AGHT+IF8R3nC3OOhRXNw3eyWrvGSTDxyTbtg5vt6TESUNt6+XPxfKOBg2A0MXmTNrYGB5tYJ/7Cuuel67Nv0OOga/Oo=
X-Received: by 2002:a05:6871:60b:b0:2d6:af0:8d8e with SMTP id
 586e51a60fabf-314dcac1ff4mr1326080fac.2.1755864505307; Fri, 22 Aug 2025
 05:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fc0994de40776609928e8e438355a24a54f1ad10.camel@HansenPartnership.com>
 <20250821203407.GA1284215@mit.edu> <940ac5ad8a6b1daa239d748e8f77479a140b050d.camel@HansenPartnership.com>
 <2025082202-lankiness-talisman-3803@gregkh>
In-Reply-To: <2025082202-lankiness-talisman-3803@gregkh>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Aug 2025 14:08:12 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jnRU9AGHuOMsGdGwYNO6S88X+EN+WM42UtivUs3TykBw@mail.gmail.com>
X-Gm-Features: Ac12FXwe-aNnj7Hf764T3SRtclN2XPwGym1nJtKBX8FUlKtLFz9mQg525FR-TIs
Message-ID: <CAJZ5v0jnRU9AGHuOMsGdGwYNO6S88X+EN+WM42UtivUs3TykBw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Adding more formality around feature
 inclusion and ejection
To: Greg KH <greg@kroah.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 2:03=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> On Fri, Aug 22, 2025 at 09:09:04AM +0100, James Bottomley wrote:
> > So what I saw is that as developers exercised this and effectively
> > disengaged unless directly attacked, it pretty much became all on Linus
> > because no-one was left in the chain. This is precisely where I think
> > we could do with an alternative mechanism.
>
> You are implying here that we all just "ran away" and left Linus to hold
> the bag here, which is NOT the case at all.  This specific issue has
> been discussed to death in a lot of different threads, public and
> private with lots of people involved and none of that would have been
> any different had we had some sort of "process document" ahead of time.
>
> So I don't think that attempting to codify the very rare occurrences like
> this is going to really help out much, given that they are all unique to
> their time/place/subsystem based on our past history like this.

I agree.

