Return-Path: <ksummit+bounces-39-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A8367B38
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 2A8281C34C2
	for <lists@lfdr.de>; Thu, 22 Apr 2021 07:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1392FA1;
	Thu, 22 Apr 2021 07:34:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB5470
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 07:34:50 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id s2so13898918uap.1
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 00:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v6nIj6PmHMpOGY67a/v+BQKTliSJNIFKunoCKiJYG9o=;
        b=rCC7Ei7sJuFyvIQzrOUbsp7WrZwc0T5Vl4LQrn9Zo8nleGhw7LHfxCT6k8p3s8Q9W/
         iaDG0hUkKORblO72AaK/Xdzz+wwMx6qvuC6xqP+zoycDfw9LBoKCI+6NJqi1fAysMPyx
         yMGAdGq9GGKaJU6ks+OOFCiuQWDg9Sm/8fOEJ41NWmm/2N2aFmsyuAbFthyWQDJri/I+
         fBd2NaOH2Z46uPLFEhMyO/9D6T5m7mCjkFCMcLVfnRQBG6rd5vNm/YT3xURa/Nn+u169
         aYX0U0NNNX9CsaESqjCoPlewdfUMRNK5A2s+Kv9hzR0xfkRLO6dNqkJJCjOLhK4nnbvA
         bkhQ==
X-Gm-Message-State: AOAM532bnKpLZWxCTG6qiFrrmAbWwCA1wjJHwIThG8HsJZ+ICBndLAeR
	3wkrAXCR5deYr4969bmGrg+TLLBx/CH+vDjLAoM=
X-Google-Smtp-Source: ABdhPJxLeUueREecCcs9MK3cytORugduCF+TryZKKezQ6GOSnVIIAFNv1KJD58m4/+AxUb5V+ROjkKIQPNJIP1Op+xM=
X-Received: by 2002:ab0:6306:: with SMTP id a6mr1217338uap.2.1619076889572;
 Thu, 22 Apr 2021 00:34:49 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien> <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien> <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
In-Reply-To: <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Apr 2021 09:34:38 +0200
Message-ID: <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: James Morris <jmorris@namei.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, Stephen Hemminger <stephen@networkplumber.org>, 
	Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 21, 2021 at 11:50 PM James Morris <jmorris@namei.org> wrote:
> On Wed, 21 Apr 2021, Julia Lawall wrote:
> > The apology states that they didn't detect any vulnerabilities.  They
> > found three non exploitable bugs and submitted incorrect patches for them.
> > When the patches received some positive feedback, they explained that the
> > patches were incorrect and provided a proper fix.
> >
> > So they damaged trust, but not actually the Linux kernel...
>
> The issue is that there was no consent and no coordination, so we don't
> know the scope of the experiment and whether it was still continuing.
>
> We are this not able to trust anything the group said about what they'd
> done or not done, until now [1].
>
> In all probability there is nothing further amiss but we would not have
> expected them to use fake gmail accounts to submit bugs to the kernel
> either.
>
> It's now on us to audit all of their known contributions, because we don't
> know the scope of the experiment, which was based on the use of deception,
> and we can't make any assumptions based on what they have said.
>
> We also need the identity of the 'random' gmail accounts they used,
> although this should be handled by a small trusted group in private, as it
> will lead to privacy issues for kernel maintainers who responded to them
> in public.

What do we gain by blindly reverting all[1] umn.edu patches, and
ignoring future patches from umn.edu?
I think all of this is moot: other people may be doing the same thing,
or even "in worse faith".  The only thing that helps is making sure
patches get reviewed[2] before being applied.

[1] Judging from the new review comments, many of the 190 patches
    to be reverted were real fixes.
[2] Whether we can trust the reviewers is another question, and might
    become the topic of another research project :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

