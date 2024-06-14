Return-Path: <ksummit+bounces-1279-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD31908E5A
	for <lists@lfdr.de>; Fri, 14 Jun 2024 17:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE4A828CB09
	for <lists@lfdr.de>; Fri, 14 Jun 2024 15:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BF5171E71;
	Fri, 14 Jun 2024 15:08:58 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895ED16F0DD
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377738; cv=none; b=iaHQvz6AjAOtvZualaooz+cyfYXWutJaoIb7j5B99Qr6WULKXfBhim3fsENDkoLaOeqUKvlAseVibSsusbVOdXWyEsCzNiUMd2SvVMMqXP0AFP2+im5jN8kSw+Kdt2W4TSMQ5xZVmsWzUdf1W5Ill94zUcW36wYWW8B5Tnj6KYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377738; c=relaxed/simple;
	bh=kxuVEbCxLeBxri7DgLvWlBwyw4VcvA/qa4VL/H2Qk70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZRf60fRam8tFNoJRYskdloY/vpHAuvkwXC629lZERoKjbF//IB8CF32PICPYDuhrjdTh2NLOlrngez/z+hQCQ0TKWnfWRxE9iZAVo8Dz/QvfLxsG9npg5fctVQmKiRPbuSJtl9q/x81cFJ8ErxRbzwVmuGV9/aT64fQdxmkVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dff0067a263so2593359276.0
        for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 08:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718377734; x=1718982534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF/TYqromTglSdJi6IoXkGDOyNfML24wz8WpYYPCjkk=;
        b=An7yJ6JDHPRvp1m2z3j93ped2ipQSRn4qNc5FbOXodP2j2VorxSZI2NnxMZsxbFIXI
         SLpOmo5iy6Mxl5TFti3B2vTTTo8y6RcVu5me7fDc4PaSn1Y5NAzNf1+zftvqH7hEZT49
         X/YiMY7gejT7a67Gd7lU06t1X4elJ+I7rVk9hyVqpY+H0Fr0O0BzTwjEFEv+cFhURL/8
         dwSIKAIrESqYPJk5o8XJknWcY35RBx6LLNkLzmqyQGH+dDv1mHmf18ZggRvYfr0Zlval
         L9SinyU3EJngmGla3+Ht/Tn2GVGT5/qwy0idqVvJ6Un9J/LuQwukcN5suxJ0TonJhtkH
         WkXg==
X-Forwarded-Encrypted: i=1; AJvYcCWd+gYnqtaLhOS/MyXbyw2jposR+S8G7bYe6xv8aD4MieGglKi6LXf/8hNi9jpX3GUWdQNU+H//p0Iyh8eC/oOg4zLKDvfbaQ==
X-Gm-Message-State: AOJu0Yx9UW4sE49VZyCYvBIbcOCWzamSN7d5h2dnKzCyxdw7mtEQMpsg
	Pi0xcfSkGqdkH9upsqoMkRjLgSX9KXw2miHvZnUK7zNVR3dLiiL8OM9iyrXn
X-Google-Smtp-Source: AGHT+IH++7R/vsaxNDzjqqzZe8bckgajccdEteJK5GIyP5OiL8OihDXK78wHfE9/B9VAAawl9LAkkg==
X-Received: by 2002:a5b:44:0:b0:dfe:3de:87a0 with SMTP id 3f1490d57ef6-dff1537db29mr2619481276.24.1718377733606;
        Fri, 14 Jun 2024 08:08:53 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a8ba45sm559034276.58.2024.06.14.08.08.53
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 08:08:53 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dff0067a263so2593348276.0
        for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 08:08:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOfrQa8TvS5czZqtPdJBE+xAY7/ggiRWBlu9RzYv9vGUWksNe2xs3YarK92UKX3AcL7VvqMoOZSM2dqEprlHTH0cwHutObbw==
X-Received: by 2002:a25:6609:0:b0:dfd:be95:f305 with SMTP id
 3f1490d57ef6-dff15342988mr2805045276.5.1718377733085; Fri, 14 Jun 2024
 08:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse> <20240614-almond-lorikeet-of-reading-6d959f@lemur>
In-Reply-To: <20240614-almond-lorikeet-of-reading-6d959f@lemur>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 17:08:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
Message-ID: <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Fri, Jun 14, 2024 at 4:38=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Sat, Jun 15, 2024 at 12:29:09AM GMT, Michael Ellerman wrote:
> > > 1. disambiguates Link: trailers so they point to relevant online disc=
ussions
> > > 2. allows tooling like b4, patchwork, etc, to reliably match commits =
to
> > >    submissions for the purposes of better code review automation
> > > 3. allows stable and similar projects to better track series grouping=
 for
> > >    commits
> >
> > Message-Id: sucks, I want a link I can open with a single click.
>
> But why would you want to, on a regular basis? Viewing the series submiss=
ion
> has got to provide near zero useful info -- if it was accepted into the t=
ree,
> then at most it would have a couple of stray code review trailers.

I open these links regularly (as in daily), for various reasons:
  - Finding the thread to reply to when reporting a bug,
  - Checking for new Rb-tags given,
  - As a starting point for reading earlier submissions of the
    same patch,
  - ...

Lots of tools (gnome-terminal, mate-terminal, gitk, cgit, ...) support
opening URLs in commit logs at the blink of an eye. Having just a
Message-Id means more work (yes, I have lore configured as a search
engine in my browser).

That's also why I detest people putting patchwork URLs instead of
lore URLs in the Link:-tag: finding the thread in lore requires one
more click on "mailing list archive" (for patchwork.kernel.org)
or a copy-'n-paste of the Message-Id (for oh-the-horror
patchwork.freedesktop.org; and what if freedesktop.org goes away?)

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

