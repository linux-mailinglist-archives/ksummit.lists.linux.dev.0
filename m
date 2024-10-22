Return-Path: <ksummit+bounces-1595-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467B9A9A6E
	for <lists@lfdr.de>; Tue, 22 Oct 2024 09:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7DD7B2138E
	for <lists@lfdr.de>; Tue, 22 Oct 2024 07:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF8214EC4A;
	Tue, 22 Oct 2024 07:02:44 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3432146A73
	for <ksummit@lists.linux.dev>; Tue, 22 Oct 2024 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580564; cv=none; b=IYd3Afy2zHgzdBBFNXEqtenIovvQ86AM2iOXFS4mALtAWsrlgIhwHoQMKRfgwBlvQiWthwOnNWC7NX0FK6+QA3Xck8KZg1QXz96evC/aWf75A8C2vKDTiQY1btzvgd6TdhA0uJ43h9I21SxSKV6NRyZOUnHOenpMc6uuvfKqBkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580564; c=relaxed/simple;
	bh=bQxg+7CWgByU55ZsjSqw/LyVBrMSQrwOKSgUZspO9yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBMxXUaG21GDQmruJNWz3bADznZslSdlFEwol0cFCtnMHD4o5ExK1v2dt73It8DEVceGW1vzrjwnWEI6WmLBXOvF+Uz5MMXnxTtIy4HWdaTG4BGi1LYmhVGd3j4p0oHkfhlJcjPfF3i8SHDAcalJhpK8v90cBedYa/BE/xKnHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2bdbdee559so2090593276.1
        for <ksummit@lists.linux.dev>; Tue, 22 Oct 2024 00:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580560; x=1730185360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctRRa+ldOzC4pbypyT6zXnt+163N2KDNV7TcqDdAlP4=;
        b=RbtV/3UYqkpiqaG9XJyeyg8gyQsUInduQ449bqeRJYSE0FC9OWttbBzVCLrbpkXTJ3
         uewGRYHXuFSi6/tBaJXgugKksEs8U5jMxaMq2V7OlPM7I8hWW9X7pA5Fd6P87Fym/deA
         wHA/Z1mn28i4i9sDXvT+oCRAaVdU1GoNWUhOlGohi0eESqau/UXE2Ah9ZJ41Rh+NmfoE
         6K2dZm1mLhEHDWdesRZz37911laP9jPWZhf+I0u3wVcnTL1JtPzWFIxw52yWm1TWcjaf
         J/SJwjuxmvEIPUJHCdzHzMsT1oO/cx4RiOAi5S9jEY+BqKh9ZczIADDkX/ELy88V9a/Z
         k+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWqFTD6EEJPviWYsbH+qAkQYP91Pv9NXI45e+wGTxbrhyZx8NVCqhTY8NfwY/IxSIlwmxW7Wb9M@lists.linux.dev
X-Gm-Message-State: AOJu0YxukxzbO/1kerveSPuoiQ2pFuM+7fNMZYRP1zs2dPOFDahuJu6l
	JsCTnyereX9rLTHL9y7hrhsp6D1qcy+7LN8Njc0g8NP+2/XIjWp6NhRdFE+T
X-Google-Smtp-Source: AGHT+IEqd/2gC3bKLYK4kQR/ONDfUktyRT61CpNR6/ro6YfYK+tNpFK/fbZEbSBrMTwdSnVkMYQvpQ==
X-Received: by 2002:a05:690c:386:b0:615:1a0:78ea with SMTP id 00721157ae682-6e5bfc4194dmr144438467b3.34.1729580560462;
        Tue, 22 Oct 2024 00:02:40 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccfb35sm9614217b3.100.2024.10.22.00.02.39
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:02:39 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so4835449276.0
        for <ksummit@lists.linux.dev>; Tue, 22 Oct 2024 00:02:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8muNgFRbXYpZ4TzFY0sVXZZ9thvi/NKNuFCR6fqPWDc6fkjpFdXR6GsE1hIzYWgVi0exX7qtC@lists.linux.dev
X-Received: by 2002:a05:690c:f12:b0:6e5:e6e8:d546 with SMTP id
 00721157ae682-6e5e6e8d889mr90834957b3.2.1729580559446; Tue, 22 Oct 2024
 00:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
In-Reply-To: <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Oct 2024 09:02:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWueY8BJKpYrPTh-LKOvBnyyN4k+nHN9u9E9OnGWbVNvA@mail.gmail.com>
Message-ID: <CAMuHMdWueY8BJKpYrPTh-LKOvBnyyN4k+nHN9u9E9OnGWbVNvA@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Kees Cook <kees@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, torvalds@linux-foundation.org, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 6:55=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On October 21, 2024 9:07:13 AM PDT, Sasha Levin <sashal@kernel.org> wrote=
:
> >In an attempt to address the concerns, we're trying out a new "linus-nex=
t"
> >tree is being created and maintained with the following characteristics:
> >
> >       1. Composed of pull requests sent directly to Linus
> >
> >       2. Contains branches destined for imminent inclusion by Linus
>
> But this means hours or a day or 2 at most.
>
> >       3. Higher code quality expectation (these are pull requests that
> >       maintainers expect Linus to pull)
>
> Are people putting things in linux-next that they don't expect to send to=
 Linus? That seems like the greater problem.

Exactly.

> >       4. Continuous tree (not daily tags like in linux-next),
> >       facilitating easier bisection
>
> I'm not sure how useful that is given the very small time window to find =
bugs.
>
> >The linus-next tree aims to provide a more stable and testable
> >integration point compared to linux-next,
>
> Why not just use linux-next? I don't understand how this is any different=
 except that it provides very little time to do testing and will need manua=
l conflict resolutions that have already been done in linux-next.

And many actual issues have been seen/worked around in linux-next
a few weeks before.  In addition, this might make people laxer
w.r.t. linux-next, thus increasing Stephen's work load, and making
linux-next worse for actual testing.

> How about this, instead: no one sends -rc1 PRs to Linus that didn't go th=
rough -next. Just have a bot that replies to all PRs with a health check, a=
nd Linus can pull it if he thinks it looks good.
>
> For example, for a given PR, the bot can report:
>
> - Were the patches CCed to a mailing list?

This check would be good to have for linux-next, too.

> - A histogram of how long the patches were in next (to show bake times)
> - Are any patches associated with test failures? (0day and many other CIs=
 are already running tests against -next; parse those reports)
>
> We could have a real pre-submit checker! :)

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

