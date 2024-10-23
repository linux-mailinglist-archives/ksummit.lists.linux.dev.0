Return-Path: <ksummit+bounces-1618-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616599AC1D4
	for <lists@lfdr.de>; Wed, 23 Oct 2024 10:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220BE2833F0
	for <lists@lfdr.de>; Wed, 23 Oct 2024 08:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C8A15A85A;
	Wed, 23 Oct 2024 08:36:37 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A021155327
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672597; cv=none; b=d8AZSIs7BuCe/gnuUYUvTrRMCDeWNbnIpvH29FWfo2BQ1kIuqfjbsoh2ylewtvjPeV0DrWcCc5y5MOCNV11D7mh0D+45Fumo1FgR4SrOmoCFa2vDA5oxDVjCgSfcZIWJMc4HVYPK/nVlkr1HAMsNgrQLKXIA5n1BwloaUNoXBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672597; c=relaxed/simple;
	bh=WoszXx2jVWnLZANPTXKiGpUlWzGprmlyNf1SgZ2h6/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGTgJq7+suuoRDmUnkJQVqYgUyAFDgBByhL8pCTWnMNeqlvMzB3TQMXHgd2Bp9MTWI+DdGij2vov3zDZ+vqwTgsjWRA2lxzyhbGs0DX4iC455icwt1tDhxTVNJfD/jy0IqI2rbbJi1WeDfXFBbiC2jIlt/+UVOjLQnXc4qJXPmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5a15845easo57394457b3.0
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 01:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672594; x=1730277394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9mLvo2WeXjPwcQq/5DwDt0k4XI3pjJ/l1xXIcYug8o=;
        b=R7VobJhc26v4WVKgck4frLXPV/Yavh62UC+eQ4NbxX4WXblEvWm8Lvte9Skja2ZTDV
         ICOghoOydq9AQIaVOihmrVHOAbqCX5QUw+1Suhiz69wKP3HOYlqjj4kxZFYB0tUv3mm+
         gYGud23+5lUMlRLsAZ3UKvnR6fDyZoog2J9iuP5x8zDuQ44hDxeZU5IJz1kVusoeX9Ke
         jsrmT8EB2ESADhRqugcMn/h/Bmr3f5MmQ9B4HdHv389oXCNBV+d8/ijEa6cPKsY4SeHo
         wJwG6i5daB88sAsE6Z79ncr3GQ+DtmcGv5qrCQPmzplG92yVcCFwD7c6GfYT2JFrQ16r
         5yjw==
X-Forwarded-Encrypted: i=1; AJvYcCXs4XPSkNYkqNPMgMC8LX+HoZekn9LzGSnZWoEU1zpgZ8cNX3tS+C4p5uVfDhewMm62hDKz7dxO@lists.linux.dev
X-Gm-Message-State: AOJu0YwthyVmoa12uvR8JAr5lsgrRqRpeXC8fHfMVhtGhKTrdJtsIBbS
	HFSJS70MOZEsrw/kLdX8wuhv9vZYRPn4mP+pRuWqJCUbEqvB0deH2ge9lU5A
X-Google-Smtp-Source: AGHT+IE2fAVuusfm9umAhJkny9mPtNRzbTqwu6HMxVL3XXNgjrtyJRYo901amJo+Ivx8UUmynWliiw==
X-Received: by 2002:a05:690c:e21:b0:6e2:a129:1623 with SMTP id 00721157ae682-6e7f0fc11dfmr18519107b3.38.1729672593800;
        Wed, 23 Oct 2024 01:36:33 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5acc362sm14393987b3.59.2024.10.23.01.36.33
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 01:36:33 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5a15845easo57394317b3.0
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 01:36:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/wjTA2rm2QapML9ScWeqSlSRDWrxcARPcfqEUMM7fhCFRZqLf7b7ixDGybmzMKP+taZAyVUSZ@lists.linux.dev
X-Received: by 2002:a05:690c:4b06:b0:6e3:2e20:a03c with SMTP id
 00721157ae682-6e7f0e49ef0mr20466497b3.26.1729672593282; Wed, 23 Oct 2024
 01:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <20241022041243.7f2e53ad@rorschach.local.home>
 <ZxiN3aINYI4u8pRx@infradead.org> <20241023042004.405056f5@rorschach.local.home>
In-Reply-To: <20241023042004.405056f5@rorschach.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 10:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxrULbo=A77DFDE4ySbii3jSMuh8xVvUXaqyCnwEAU-w@mail.gmail.com>
Message-ID: <CAMuHMdUxrULbo=A77DFDE4ySbii3jSMuh8xVvUXaqyCnwEAU-w@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	torvalds@linux-foundation.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Wed, Oct 23, 2024 at 10:20=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
> On Tue, 22 Oct 2024 22:47:09 -0700
> Christoph Hellwig <hch@infradead.org> wrote:
> > On Tue, Oct 22, 2024 at 04:12:43AM -0400, Steven Rostedt wrote:
> > > You mean have everything go into linux-next before going to Linus aft=
er -rc1?
> > >
> > > I'm one that doesn't do this. That's because my code in linux-next
> > > after -rc1 is for the next merge window, and the code I send to Linus
> > > is only fixes for code I sent before -rc1. I tend to keep an "urgent"
> > > and "core" branch. My "core" branch is everything I plan to send in t=
he
> > > next merge window and goes into linux-next (via being pulled into my
> > > for-next branch). After I send my pull request to Linus, and he pulls
> > > it in the merge window, that "core" branch becomes my "urgent" branch=
.
> >
> > You can easily have two branches in linux-next.  Many trees do that.
> > It is also a really nice warning about self-conflicts.
>
> I actually do have several branches in linux-next. But they are all
> topic branches. My urgent branches usually mirror them (by naming
> convention). My scripts pull my for-next branches together and then I
> push them up.
>
> I did push urgent branches to linux-next some time back, but never
> found any advantage in doing so, so I stopped doing it. As the code in
> my urgent branches are just fixing the stuff already in Linus's tree,
> they seldom ever have any effect on other subsystems. My new work does
> benefit from being in linux-next. But since I don't find more testing
> in linux-next for things that are already in Linus's tree, I still
> don't see how its worth the time to put my urgent work there.
>
> To put it this way. The bugs I'm fixing was for code in linux-next
> where the bugs were never found. They only appeared when they went into
> Linus's tree. So why put the fixes in linux-next, if it didn't catch
> the bugs I fixed in the first place?

Hmmm...

Your arguments sound very similar to those being used in recent
discussions about not posting patches for public review...

Please follow the process! ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

