Return-Path: <ksummit+bounces-1360-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69427917A92
	for <lists@lfdr.de>; Wed, 26 Jun 2024 10:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046731F2506B
	for <lists@lfdr.de>; Wed, 26 Jun 2024 08:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFD715F3EA;
	Wed, 26 Jun 2024 08:12:52 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64532364BE
	for <ksummit@lists.linux.dev>; Wed, 26 Jun 2024 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389572; cv=none; b=XCzSzt43cQAVOH7VtvPlO+L+PtpFNIvIq3FmwjK4/1cNHmZ5JZjEnjWAxss/z8ffatjUNPxN0g3bxOYhqLH6G8RJZxWgIPQQUAW7gPJln1d+7tIonFjPuIOQPzKua1Dftt6BIQd+IYIW7px8wsg95QMBTkWYPkGGI11Q2N7tH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389572; c=relaxed/simple;
	bh=D5Cbu+U1HZWDIHt0LpKSf7Cur/m6GJUgdd7v+AQOkfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m78qEGzlze9bThDdKa39jjSzsZqPzWw1gPOzGgaLp3zl+lILAX43345Cj1woaU6LwOV9Yq7pqBFpwhMRKtVwLwZxUcrnhoqhgCEYDTwps6EPjJ4uHbUrnUIevOrylUReceiqPXReGqvkuMukW/QktFs0kR3w/703NavVKpRAzF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfe1aa7cce2so6082975276.1
        for <ksummit@lists.linux.dev>; Wed, 26 Jun 2024 01:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389569; x=1719994369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6yFjbUBltT3UtsPx++KaysizwCAujSrK4XvFo3PCu0=;
        b=B/eo683wcTzzW6d52NQpKg3Gr+d4lnCiLPbX9QYbP+bLo7hHXDnNehCAxWiKW6sFfh
         jA3t61LqyF+nUeYflg3HKXOcetIRd2t1swheY1vSN3S3/XnnEfTePNsIfLNmXjWSboII
         zs0PlDjh8U4QY+vwldJSOIfcjT4reStOVrQ3FaREj9ZBXX2tQLTJzbk1+RefC/cYhD4f
         pCIzuhMw1L6w80jJyafuB4mVGNAtWzdg1hbi63yoRxIr+IqSncEG3bNaoLaVHbqftrLu
         6R95jIaClKeXBuE6hHnDxu0Cik0DKaGDOtIntdTDfusix7pV8ViBNQQXpJBxqoHbQS6W
         tF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWadYfX4eYzifFsxAg+Vdm6FJlC9ccNCEOUPiIIHS2yuh5qfNJwPz9RJ/UH6U/0qFoCj9/Lns6FLuuKyOMJknys1onTsnunbw==
X-Gm-Message-State: AOJu0Yy5Tv8+Zp51yUcr9ywqpoPCUcnaYr8WkaYOK+nbftb2UenrGfXW
	wUHbWN6huNMddD3N6/UgB1OsAqMkSNnS4kyYVnoDUlDFEIhYr8/fQTKXzNir
X-Google-Smtp-Source: AGHT+IFbWa+yDneqEBDLhUaEoblFNElcG2CacIAedsi0hIgfoajObeMZVeBZHrB/AFs9KrhdhrrH7w==
X-Received: by 2002:a25:83ca:0:b0:dff:3243:aadd with SMTP id 3f1490d57ef6-e0303f2ab33mr9819703276.17.1719389568675;
        Wed, 26 Jun 2024 01:12:48 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e623d1cbsm4309382276.22.2024.06.26.01.12.48
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 01:12:48 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6439f6cf79dso30766787b3.0
        for <ksummit@lists.linux.dev>; Wed, 26 Jun 2024 01:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJTKOizVaqx0DHp3QLG3WQCM+Yg5zpxbdwG9rAwz1hIUvbLB9Zhy/GzCIpYJaUmz3awr/2JYg7Q8QxjMEOMLGjbdQCe32vdg==
X-Received: by 2002:a05:690c:6e0c:b0:617:cbc7:26fe with SMTP id
 00721157ae682-643a9fcecb1mr105251747b3.16.1719389568194; Wed, 26 Jun 2024
 01:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org> <20240625172727.3dd2ad67@rorschach.local.home>
In-Reply-To: <20240625172727.3dd2ad67@rorschach.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 10:12:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHa52RBjzA4eF4ERNuJjRHyq=FfyPz-yOsjOA7ZQfouQ@mail.gmail.com>
Message-ID: <CAMuHMdXHa52RBjzA4eF4ERNuJjRHyq=FfyPz-yOsjOA7ZQfouQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Tue, Jun 25, 2024 at 11:27=E2=80=AFPM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
> On Tue, 18 Jun 2024 12:42:11 -0400
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > +     A similar approach was attempted before as part of a different
> > +     effort [1], but the initial implementation caused too many
> > +     regressions [2], so it was backed out and reimplemented.
> > +
> > +     Link: https://lore.kernel.org/some-msgid@here # [1]
> > +     Link: https://bugzilla.example.org/bug/12345  # [2]
> > +
> > +   When using the ``Link:`` trailer to indicate the provenance of the
> > +   patch, you should use the dedicated ``patch.msgid.link`` domain. Th=
is
> > +   makes it possible for automated tooling to establish which link lea=
ds
> > +   to the original patch submission. For example::
> > +
> > +     Link: https://patch.msgid.link/patch-source-msgid@here
>
> Hmm, I mentioned this in the other thread, but I also like the fact
> that my automated script uses the list that it was Cc'd to. That is, if
> it Cc'd linux-trace-kernel, if not, if it Cc'd linux-trace-devel, it
> adds that, otherwise it uses lkml. Now, I could just make the lkml use
> the patch-source-msgid instead.
>
> This does give me some information about what the focus of the patch
> was. Hmm, maybe I could just make it:
>
>   Link: https://patch.msgid.link/patch-source-msgid@here # linux-trace-de=
vel
>
> Would anyone have an issue with that?

Or, just like with lore links:

    https://patch.msgid.link/linux-trace-devel/patch-source-msgid@here

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

