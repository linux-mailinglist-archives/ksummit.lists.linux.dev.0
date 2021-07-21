Return-Path: <ksummit+bounces-435-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438C33D1007
	for <lists@lfdr.de>; Wed, 21 Jul 2021 15:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 116D51C0E59
	for <lists@lfdr.de>; Wed, 21 Jul 2021 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551002FB6;
	Wed, 21 Jul 2021 13:46:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D7F72
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 13:46:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id a12so3233571lfb.7
        for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MH3wH7GQIEv1Swdd+QIQdDVT9ekDsdelmOZ3OOsqFXc=;
        b=O+uSOLGTYQVTJhJjKKImWEMyxJwDpqN4zKz7eDGNQ/A77WZNoudpwEiukD7OmO2Xj7
         U95ec2u2G2F8l7GIV12R8oS2wAAa/LXlSWDJKu3YH9RJdmLDTxWgiHvurFYMDSub4LlN
         Toue1x8Aha/F4znxhb+sd0JCVzrAb4yMCSLY1x+IFmjg7iEQkHugUABIKM6d1dGok6AL
         SrGJAmmXPrqmTD3pgod7A583G3MPrHGv2sTV5P+dgkVChuDmFJ2LNxv8MN6AYfUv061C
         fRlNClzh+ap7Wy+4kF6RTOjoJSmol6qWBISeJWe6c9hA9lxl0Fy7VhGhelD+IrtBUtSQ
         Vo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MH3wH7GQIEv1Swdd+QIQdDVT9ekDsdelmOZ3OOsqFXc=;
        b=EJihuublZG9WJxanJbFDPcq56LUCWgrUdtdBf7hWsjx6FW3LKBmCiBVUYHhjKb0RFg
         uAjIkiZ0o78rGTFxR8mv8dg5pTgB5pBjtDBBeJ3wSQnTyCKWs5HZgOYSB2X2FLjw9xvr
         L9d0jiiGx+AglvDdLJA85Ug6o6KJITWNi/S21hq+l9LxKoyop5PZMtIT/Lz7MGtNcowb
         cSJaOHYfjQTJcpv+1l1npexhI5Gv56hIkfD8zsSvtlBRhJs6t2HjYKwTLVJHo68YWHXG
         sdSDIzzPvtItwByy+/R64Ndh7kW1nlEGiB+OU905udSHkJ9OskvgyAEh+TmExktgvjL3
         OjJw==
X-Gm-Message-State: AOAM532Ka68LQeH1aJYlZTDRrEtj8cGIX1e7LvR03sVtI7iyM49vda56
	fHzcB6ep6RXmwZymR/1ILWGFfBOa8aDWcRycXC1gIQ==
X-Google-Smtp-Source: ABdhPJxggVBk4jRRVyxnHpG+PH0gwjJGx8TJ238oMPEiIZcFyaSi9jA3xt7AOz9j82glz6I5cVby7UkYbD6RRBYsgQ4=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr24993123lfr.465.1626875215112;
 Wed, 21 Jul 2021 06:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com> <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
 <YOh/JC//dotfm5J9@google.com> <CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com>
 <CAHp75VfW7PxAyU=eYPNWFU_oUY=aStz-4W5gX87KSo402YhMXQ@mail.gmail.com>
In-Reply-To: <CAHp75VfW7PxAyU=eYPNWFU_oUY=aStz-4W5gX87KSo402YhMXQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 15:46:44 +0200
Message-ID: <CACRpkdbzAzwrSJmoiO8w5KPV2dL-qxgaeD+gSzL-Gg+cmajsOQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Greg KH <greg@kroah.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Roland Dreier <roland@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Daniel Vetter <daniel@ffwll.ch>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 12:35 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> To me described scenario sounds rather like an object lifetime possible i=
ssue.
> In any case, shouldn=E2=80=99t VFS guarantee by a reference counting that
> gpiochip_remove() wouldn=E2=80=99t be called while file descriptor is in =
use?
> Or am I looking from the wrong end here?

What happens is that the GPIO device disappears (such as unplugging
a USB GPIO expander) while a multithreaded userspace is hammering
exotic ioctl() commands to the same device like crazy.

Under these circumstances (which should be rare, but you know,
developers) it could happen that an ioctl() sneak in before the
gpio_chip pointer is NULL if I read the code right.

Yours,
Linus Walleij

