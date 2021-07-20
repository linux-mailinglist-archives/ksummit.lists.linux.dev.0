Return-Path: <ksummit+bounces-428-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C53D04C0
	for <lists@lfdr.de>; Wed, 21 Jul 2021 00:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 07F711C0E88
	for <lists@lfdr.de>; Tue, 20 Jul 2021 22:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3095B2FB6;
	Tue, 20 Jul 2021 22:43:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B0E70
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 22:42:59 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id q4so408868ljp.13
        for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jSe6SKHWwNunOEsVvFI3ZvLrFzsWYWZjwjCpEheqL0=;
        b=xpzSp0SPDR6mDW7ZTEoC/Q/SbFECPwd9uZKg+E6Oef0h+r7LxhoxVQZJFTiE4oUZEy
         tI84N9J9QDPhHDFvnaQrsl+/7E03nwdtLtTeeqQRyc5KXHHlFdr+hSNwa9pYv1ze3Mea
         24b3+ILpFZ5F1NlJmK3QeSDJ3JfVeys2sPT6zP5FOwItPmoIpvBWabN155nC15xjr2bO
         lklaMScR21XWzzG/D6GMOnR+tA5Rp3DXdkSBwuqH0VhyeshidevljGamP5SgHm6rvHBG
         gSSn6M2EX25yakqMNC2DlsonQUr2VmlL0nuomUsa8pqxCUPCQnx8eguEEKyFKfSAw07v
         pqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jSe6SKHWwNunOEsVvFI3ZvLrFzsWYWZjwjCpEheqL0=;
        b=jXZEITafS8YUFE2jGeyCCezIyKQtV5tZWpYHZoNmBjf5z/C973u7y6OOBj+9riVny2
         L/urpJo+g7kdC94tU1LO27r3Q1bZ6MTzgUxmvtwcZml4ZLD76CKsmjZy9yoTBfBZkN3P
         YiHR0kCJEjVUHHrb1HKpzznIdwjtK+TEuQkJmqNypPKHpXiJt1vDcq2HTZK6BMAHAwj+
         HD1FSe4kITEK5l04WuEFiXckTnDd2i3l92DEjynP+wHz2c2Qrhh46gqoZTRtT2DZQ5Sg
         B2rxSh6O8yG09fkPG1w0cvrd9m5BO9cGxAeV5UYlZtEgCURaQXnwSFhYsht9NC9OxCfd
         XuFw==
X-Gm-Message-State: AOAM530UCnogd0kmwWgoTeCgw6w27EXDfvFN5ixvdZuQ//ohum+MJNOl
	lgtyXWVgrJVWb4OOe16vESlXu3Zwl+vjEB7v6HAUYg==
X-Google-Smtp-Source: ABdhPJzBoC/1+PMwNBNibUkpnzZ0s2bW44yP3jGg68HnWQ9nNLgSfYwtqfJuF5sOUMMKerEC9Q+XBLnFuGfstHiO5U8=
X-Received: by 2002:a2e:b04e:: with SMTP id d14mr29528465ljl.74.1626820977839;
 Tue, 20 Jul 2021 15:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com> <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
 <CANiq72kHY=w8VVHUH8EyLcfRXQzq+OXOBCrrW7dHk9kkzJ_BHQ@mail.gmail.com>
In-Reply-To: <CANiq72kHY=w8VVHUH8EyLcfRXQzq+OXOBCrrW7dHk9kkzJ_BHQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 00:42:46 +0200
Message-ID: <CACRpkdZdO+e20bhec2hRQ-VQqPk_+enPsaNS6Z06MJK+Pwy3HA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 3:21 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Jul 20, 2021 at 12:16 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > To that end the core of the GPIO library would probably
> > have to be rewritten in Rust and used on *all* platforms
> > in order to buy us any improved security. I understand that
>
> I do not agree: a bug in a driver can cause havok of all kinds in a
> system, security-wise or otherwise. One does not need to rewrite the
> entire kernel in Rust to start to see benefits.

I understand and I see that Wedson also came up with some ideas
on how Rust can actually protect against some DoS type attacks.

But what attackers (who by the way are organized, well-funded and
pretty evil people) are creating and what is our biggest headache is
remote root exploits that open up systems to random code execution,
and that is why we have to take Rust to the enemy lines IMO, because
that is where it will deliver shock and awe.

The problem is not a few saboteurs in our factories in our homeland
but on the frontline with the enemy if you excuse the war metaphor.
I want to see Rust weaponized against the people who attack our
kernel.

Yours,
Linus Walleij

