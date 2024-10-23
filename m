Return-Path: <ksummit+bounces-1620-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9C9AC562
	for <lists@lfdr.de>; Wed, 23 Oct 2024 11:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEEEA280CA1
	for <lists@lfdr.de>; Wed, 23 Oct 2024 09:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A3619645C;
	Wed, 23 Oct 2024 09:23:37 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB915CD60
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675416; cv=none; b=g9zRRDsyduIPLKINykY/l3PBmr+3b4V52rDXSIsZDq8fxF2plbtHHWqbEdexPscLC61tynZJNJHJLoWsUsW0wke5JWlbTt0LJIfcxUAFW+l21XighZI6onUvj6GqwPZlqMJeQS0NjsZrU0I6PtgUozxpivEfvVNMYmOXQxs9ImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675416; c=relaxed/simple;
	bh=b873wxbOtrs++2LVoQSE881XzbQPkTOIgQkc7egGAoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpVaCSduk8QoUsrlLkKcU/i+7oAMYHAVFBkP+qkHZgzuggd+M+bRCf+N8urIbMhcM6JviWWr9yL5p/Mzz3GSvhcwrURXg4ahG572VS8GlcJZFszND4JSexWx+uBzYy+Xa7MEQk0iDRMSoMmWvTjDyXBNjXnphhftbN5C4bFppMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e290222fdd0so5677479276.2
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 02:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675413; x=1730280213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OUxjxaEtG+AG1y3fcT6N6LYOlGucW8Y738Nm7+hUf8=;
        b=gFQrZ5zrhe2T/yw0ccsNwBXQ19vcgL+5zNfPCt93X2Yi2iPBbfR7QbDOUmiTwyq4Af
         qmOGDSjnde5S+ehySjD6dOC4md833cVTqMxrmFh6w0N/dyp2EjD9KowgboIa2JzaXsWb
         9w33uv5pat6kdaMGc3idDma2Z4tG/gY/XD6hlNXq0qMUNJXNmlCo8fuiVFR2/AuW8L8L
         Prkj0I2PHUee6pGu28sdQlfN5eftdu5+3t3Duhgp3qL3kGf8+Oj10PUHZZ+Q0VkffsGy
         YiHqy0ajNL5cDlUBSLgJcYCOGz2hYB7FKl6D3gMAKlRycasl+Am9wZP4NtIdjHuV3ZUA
         YC0A==
X-Forwarded-Encrypted: i=1; AJvYcCUCoefgb2yG/UsMIbje+Ed8WpUvHjPct+ZUoptjG7kJVaQNjy7t8cH5lNXggz/a4d981Wwh4ePj@lists.linux.dev
X-Gm-Message-State: AOJu0YzDY5DrbQdH5W+NW7GqUXYSxglirevjihDo8Pm6w5x0f7+54fHN
	Ktb6uUysmnDG+Fc7HfvILvvoCJPub+M6a/ZXY93loYPEaiGq18kq4HMx8BM8
X-Google-Smtp-Source: AGHT+IFPPOZboGL0QZI6mMpWIPefXO9SINY5EsyltT0dE2WYt0XrzcSNyNYKMgeTCCJ5T1U18l2KMA==
X-Received: by 2002:a05:690c:dc9:b0:6e2:aceb:fb47 with SMTP id 00721157ae682-6e7f0db7563mr21592227b3.2.1729675413427;
        Wed, 23 Oct 2024 02:23:33 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e7f7edf574sm1579977b3.106.2024.10.23.02.23.32
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:23:32 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e3d7e6f832so63361027b3.0
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 02:23:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5e0vg65xUjRpeBxUhrqgmDFuyVm0S+hDhE7EyIfiYlKpki5P3wi7++kX+DnQyyqouylOB6nJK@lists.linux.dev
X-Received: by 2002:a05:690c:9a06:b0:6e3:b6c:d114 with SMTP id
 00721157ae682-6e7f0fd7dc1mr16599767b3.38.1729675412363; Wed, 23 Oct 2024
 02:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <20241022041243.7f2e53ad@rorschach.local.home>
 <ZxiN3aINYI4u8pRx@infradead.org> <20241023042004.405056f5@rorschach.local.home>
 <CAMuHMdUxrULbo=A77DFDE4ySbii3jSMuh8xVvUXaqyCnwEAU-w@mail.gmail.com> <20241023051914.7f8cf758@rorschach.local.home>
In-Reply-To: <20241023051914.7f8cf758@rorschach.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 11:23:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnuapbk4tcOqAS_TrsLcGz9wcC0RD5z1gzUd_GcE_wRQ@mail.gmail.com>
Message-ID: <CAMuHMdWnuapbk4tcOqAS_TrsLcGz9wcC0RD5z1gzUd_GcE_wRQ@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	torvalds@linux-foundation.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Wed, Oct 23, 2024 at 11:19=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
> On Wed, 23 Oct 2024 10:36:20 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > > To put it this way. The bugs I'm fixing was for code in linux-next
> > > where the bugs were never found. They only appeared when they went in=
to
> > > Linus's tree. So why put the fixes in linux-next, if it didn't catch
> > > the bugs I fixed in the first place?
> >
> > Hmmm...
> >
> > Your arguments sound very similar to those being used in recent
> > discussions about not posting patches for public review...
> >
> > Please follow the process! ;-)
>
> What process?
>
> Note, I probably post everything to mailing lists more than anyone
> else (besides stable). All my commits come from mailing lists. Even
> things I change myself. I always send out the change to a list. Then I
> use patchwork to pull it into my tree.
>
> After the changes are tested, I send out the patches *again* with my
> [for-next] tags in the subject. If it's a fix for Linus, it goes out as
> a "[for-linus]" tag. These emails automatically update my patchwork
> status.
>
> No change goes into Linus's tree from me that hasn't been sent out
> publicly.

All good!

> But pushing to linux-next for a day or two, what does that give me?

It may catch issues you missed, e.g. compile failures on obscure
architectures or configs, e.g. due to indirect includes.

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

