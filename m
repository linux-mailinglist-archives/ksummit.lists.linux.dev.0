Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE67D841E
	for <lists@lfdr.de>; Thu, 26 Oct 2023 15:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 922441C20F35
	for <lists@lfdr.de>; Thu, 26 Oct 2023 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B952E411;
	Thu, 26 Oct 2023 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2B2D791
	for <ksummit@lists.linux.dev>; Thu, 26 Oct 2023 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so666333276.0
        for <ksummit@lists.linux.dev>; Thu, 26 Oct 2023 06:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698328782; x=1698933582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20XxON5XilTKGJ9SIc8r5pwdKYtKKocsfNkQqf5x/4c=;
        b=cfR9zhSGNM2BAcJRuAT4tkIaYsczAjDrRaxL1GxtTrPJ7O9Sh6lXWPsyVz9KrwsJYp
         7xOTHGhfwOjh0qZ6nI6Fr8mpY51VJPArq2vtjbyEXmBfH5fODbZtRldee2fl3LGMc7vg
         62d6hfOBiPBhN4X5cFM+i4/U6FiZ5b8PsaCTPXzftgtm49eGhtDks7uVeTd0pqsIA0pQ
         DF16TQj1OUmeHLHyzdi2w9X45EVrrou0qq2vuiOvofpoGReDUe3R8Fx4UPPR261someh
         DoNL/aiCeyxHqynLVGuE248R7cCg02uj1+cgStA7cD5wbfqpMJe5HCZpjGDjpI6oSYaj
         kIog==
X-Gm-Message-State: AOJu0Yx0at32wGN80AVyAuSS/6PNS4lGXmUGYpDSZ9X/skI1Q1kg8YDc
	X91KGZ+DTR3DGj93SMRo2zceu0EZtl4Cfw==
X-Google-Smtp-Source: AGHT+IHgutvDETsn4AMOgH3vZON8vmLBnaCS2cltRGuUhXiWOhdN3VAqb/KIQIo9DGv990zJhx/ORA==
X-Received: by 2002:a25:4004:0:b0:d77:e338:1b6b with SMTP id n4-20020a254004000000b00d77e3381b6bmr17026436yba.14.1698328781922;
        Thu, 26 Oct 2023 06:59:41 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id e184-20020a25d3c1000000b00d8674371317sm5324071ybf.36.2023.10.26.06.59.41
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 06:59:41 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-da0344eb3fdso648485276.3
        for <ksummit@lists.linux.dev>; Thu, 26 Oct 2023 06:59:41 -0700 (PDT)
X-Received: by 2002:a25:ef48:0:b0:d9b:4f28:4f7a with SMTP id
 w8-20020a25ef48000000b00d9b4f284f7amr19582865ybm.55.1698328781289; Thu, 26
 Oct 2023 06:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de> <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de> <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
 <202310201127.DA7EDAFE4D@keescook> <20231026100148.GA26941@lst.de>
 <710149630eb010b18b69e161d02502bc3b648173.camel@HansenPartnership.com> <20231026095235.760f5546@gandalf.local.home>
In-Reply-To: <20231026095235.760f5546@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Oct 2023 15:59:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9CcjGkpF=FGe_U5XtbF08bKTEYkPSxArO1zBwnug0Wg@mail.gmail.com>
Message-ID: <CAMuHMdV9CcjGkpF=FGe_U5XtbF08bKTEYkPSxArO1zBwnug0Wg@mail.gmail.com>
Subject: Re: the nul-terminated string helper desk chair rearrangement
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Christoph Hellwig <hch@lst.de>, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Thu, Oct 26, 2023 at 3:52=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
> On Thu, 26 Oct 2023 07:39:44 -0400
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
>
> > While it's nice in theory to have everything documented, it's not much
> > use if no one can actually find the information ...
>
> Does kerneldoc provide an automated index? That is, if we had a single fi=
le
> that had every function in the kernel that is documented, with the path t=
o
> the file that documents it, it would make finding documentation much
> simpler.
>
> Maybe it already does? Which would mean we need a way to find the index t=
oo!

ctags?

Although "git grep" is faster (assumed you use the "correct" search
pattern, which can sometimes be challenging, indeed).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

