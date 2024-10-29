Return-Path: <ksummit+bounces-1658-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B79B440A
	for <lists@lfdr.de>; Tue, 29 Oct 2024 09:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24C201C22169
	for <lists@lfdr.de>; Tue, 29 Oct 2024 08:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56648202F73;
	Tue, 29 Oct 2024 08:20:38 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9F201246
	for <ksummit@lists.linux.dev>; Tue, 29 Oct 2024 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190038; cv=none; b=Egi7/JyR1Zbpa3eP1XRfJHE74KShrjm/bcL0a0Lt+BIINybXsmlLYON5gFYI3J0Q2g/91GQzxzdrqq21CqyMHZczVicit3UT8m19DQa2/6IVdzvN94NTNt55C7CnrfKpCcE2vPmPRiFMblZWkqqIgm9XTUrOMHyL5AB7xoyQODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190038; c=relaxed/simple;
	bh=sxQnfhQBb8SyF7+rSrPwtZzt4KWeubEXZ7zMptVq8UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGhVMMZLock8v4zRd/gDq4D074+FUv55XLEGhGR52DOEsPyOML9eMJf/CZhMHrgHG4rOSg6QTQcXiasJVZOyjksjNbsyLlRC3CqKDSo4aAec2ItHhMByzzWuecJZGOvaneB3BA227xid/uMeGDN4kLEjzdYS4YhARGXKZn7ga9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e390d9ad1dso42479207b3.3
        for <ksummit@lists.linux.dev>; Tue, 29 Oct 2024 01:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190034; x=1730794834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbKJj/heHZ8h7dStl0WMCzBK50Xi/U4OKafIMf/dP9s=;
        b=vywqgewqj8BAWchUtKK4+LGOMxzzOR79SDFDsKDFJWp6p1KYry3Ukloqg+1qeUH0rU
         c+KX1w0u6xfzVUZt4bB3Dc/mByjfsCWepk+TerLcavPqRXrHIafwVFh+gu+gGGAQOWtG
         PLY0Sk/OXvDUq/DfiNbsO9lJcbibStst2gPqDf5qnMYfjqWxtJmN+mn5k5nGEBks4LdE
         /nj1jMnKyYh3AY1HmKarF7hePHK/KK2zHiK3aIk/9wV+exsCfdhTNiNGl0I3OpG+T/Zt
         dglBUvTAWqRynWIcbwxn4529bLTSj9z7NGlO0GXj/2yHVRb/y+9c+S/1tuICdmYW/74B
         jrvg==
X-Forwarded-Encrypted: i=1; AJvYcCVTQ1sGHXVq7uraY0LBmN6EK/ii0XD1Zv5FjOTzG0FzpMdYx/4vzz6uKg3xv7LOjJGL+EnSuHYg@lists.linux.dev
X-Gm-Message-State: AOJu0YzE9n0i/v4MpFI/6aq0weG1bzVzh1r13hApKiTc3YJmTDKe8TeP
	T8Lg9fLBBWPkr7AZNkhlbnBLXBZTIAFdonm+BsFEk9AeQmRWkwqFHbsbxKWC
X-Google-Smtp-Source: AGHT+IETkwtU2DzBPyVFNL69zXpX/anqZHvFMnust7tJXOAeV3/mpBHNqX4XTtlim2LJUg0wy58trA==
X-Received: by 2002:a05:690c:445:b0:6ea:2383:4d6b with SMTP id 00721157ae682-6ea23834e6bmr26875527b3.26.1730190033997;
        Tue, 29 Oct 2024 01:20:33 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9fee4d86esm9880567b3.112.2024.10.29.01.20.33
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 01:20:33 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e9ed5e57a7so18831707b3.1
        for <ksummit@lists.linux.dev>; Tue, 29 Oct 2024 01:20:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbASEB6Zfh4qywEyaj+pqGiRJN9UWPmtFmF0qFP2zHmzRHHASykr5sXHaAEh5xunFSCLGGqPnV@lists.linux.dev
X-Received: by 2002:a05:690c:38a:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e9d88fe24bmr107937077b3.3.1730190033476; Tue, 29 Oct 2024
 01:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <ZyAUO0b3z_f_kVnj@sashalap>
In-Reply-To: <ZyAUO0b3z_f_kVnj@sashalap>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Oct 2024 09:20:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLH1z244DC6OBQx1JDwvW_KdYaof_u6FQq4P8OUb3KNw@mail.gmail.com>
Message-ID: <CAMuHMdVLH1z244DC6OBQx1JDwvW_KdYaof_u6FQq4P8OUb3KNw@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Sasha Levin <sashal@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>, torvalds@linux-foundation.org, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

On Mon, Oct 28, 2024 at 11:46=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
> On Mon, Oct 21, 2024 at 11:48:34PM -0700, Christoph Hellwig wrote:
> >On Mon, Oct 21, 2024 at 09:54:53PM -0700, Kees Cook wrote:
> >> For example, for a given PR, the bot can report:
> >>
> >> - Were the patches CCed to a mailing list?
> >> - A histogram of how long the patches were in next (to show bake times=
)
> >> - Are any patches associated with test failures? (0day and many other
> >> CIs are already running tests against -next; parse those reports)
> >>
> >> We could have a real pre-submit checker! :)
> >
> >That would be very useful.  Items 1 and 2 should be trivial, 3 would
> >require a bit of work but would still be very useful.
>
> If you've been following so far, there is a bot that is capable of doing
> most of the above
> (https://git.kernel.org/pub/scm/linux/kernel/git/sashal/next-analysis.git=
/).
>
> Here's a histogram that describes v6.12-rc4..v6.12-rc5 as far as how
> long commits spent in -next:
>
> Days in linux-next:
> ----------------------------------------
>   0 | +++++++++++++++++++++++++++++++++++++++++++++++++ (89)
> <1 | +++++++++++ (21)
>   1 | +++++++++++ (21)
>   2 | +++++++++++++++++++++++++ (45)
>   3 | ++++++++++++++ (25)
>   4 | +++++ (10)
>   5 |
>   6 | + (2)
>   7 |
>   8 | + (3)
>   9 | ++ (4)
> 10 |
> 11 | +++ (6)
> 12 |
> 13 |
> 14+| ++++++++ (15)
>
> This is where I think the value of linus-next comes during the -rc
> cycles: the (89 + 21) commits that haven't gone through the -next
> workflow before being pulled. I'm not looking to delay the process and
> add latency, I'm looking to plug a hole where code would flow directly
> to Linus's tree bypassing -next.
>
> With linus-next, we can at least squeeze in build tests as well as some
> rudimentary testing if we get a few hours before Linus pulls (and we
> usually do).

[Oops, I misread "linus-next"-with-an-S in the last two paragraphs,
 and only noticed _after_ I wrote my comments below.  Anyway, I am
 still sending them as they (partly) explain the histogram's shape.]

Linux-next releases are not created automatically.
The last linux-next release happens on Friday (AU time), while Linus
creates the -rc on Sunday (US time), so most PRs sent during the second
half of the week would miss linux-next until Monday...

"Release early" still matters...

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

