Return-Path: <ksummit+bounces-402-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20C3CE8E2
	for <lists@lfdr.de>; Mon, 19 Jul 2021 19:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0CD613E11B7
	for <lists@lfdr.de>; Mon, 19 Jul 2021 17:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C702FB3;
	Mon, 19 Jul 2021 17:37:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B068173
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 17:37:49 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id k16so20886850ios.10
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C/mj+LubQMgoP0fQxX80OQnOmxM9tcFadyRatEiW+pY=;
        b=DHu0B3M7ccBEgRGm5v8YtvoKcf+YzG0eN92Q6J7wSnNufCWMzyY3KV4cNh7d9HDLYf
         ih0tK2ssVoJuU6wUHamcNWJ75YQhiVGJGZcgBKGXqAhu5NEGjNb8a77qeJ6eKYnfPOTV
         Y+SZsPYOx3utVJXbblM357lEXdYTM0qvFV6rKdNhV7f/5HWWAfsqbZ0db0qDdl5QfIhL
         2cIBuZ/K9AqueFFZiN09QC7hp+LfB5evg1nX7dreMrhhwb7flh8SVrlfiX42zNJkS8ea
         vCa9J/INPHF5AbVtf4IArYO24XNbwc2n4KorsRBypGZVkkIpjNgWudSAOjorg4AYC5GJ
         m44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C/mj+LubQMgoP0fQxX80OQnOmxM9tcFadyRatEiW+pY=;
        b=G+85d5NwYAodpgqQLsEfy1fH3B+VyBCvuFi1ZO1BcTDnSREl5Fs2fqCpCILqgMS14c
         K/S3EnmhCltMXVCpj1hvTfBXwJ8Bm0fltQh7bvXGKlKYpoVRD8wtFDlk/FBgenNoqa5u
         YfcfVROY/4eGA2q8hZPJ98t4NuTNbY3DjBNzIcoCJxT4eMSipNjChvFkvhEWDphIE+vK
         gkov7/ntNThT8vC/yvvBf1edMX1RGFZLWwicsxlWSyJ1NHfL2IkdLT0ctmd7zJRe1UmO
         acecHEq7kjfxG3wlboMqLULUCx/QrSIWWxI630SgZnexqSzXWhgSe0nK7WYcWTfA3bxN
         KhRg==
X-Gm-Message-State: AOAM5319Tbk4HYvsZ+FUYSTWEedWniGBokhLGP9Zw6svewUs7/gj+Q1O
	qb0979pAvgSDb/ZmkGpyFKWWRg6Bka7AAwGD61c=
X-Google-Smtp-Source: ABdhPJwW4Hwk1RgtFfQCUfl6VIFjlskZv563XjgegK9BTEOErpCnx/75YRsxjfoJhvr7ped1OUBT8GhXz3k3AbAVm/g=
X-Received: by 2002:a02:9508:: with SMTP id y8mr22764918jah.28.1626716268625;
 Mon, 19 Jul 2021 10:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com> <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 19:37:37 +0200
Message-ID: <CANiq72=tm_ERbkG1jyWwuyJqzgA9M8Hd7rCQ-tJ7Tf_E-v2wgA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 4:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> - What is the mechanism behind power::Operations that replaces the
>    #ifdef CONFIG_PM of the C version? Will the rust compiler just drop
>    the dead code when CONFIG_PM is disabled?

We support conditional compilation with the kernel configuration, e.g.:

    #[cfg(CONFIG_X)]      // `CONFIG_X` is enabled (`y` or `m`)
    #[cfg(CONFIG_X="y")]  // `CONFIG_X` is enabled as a built-in (`y`)
    #[cfg(CONFIG_X="m")]  // `CONFIG_X` is enabled as a module   (`m`)
    #[cfg(not(CONFIG_X))] // `CONFIG_X` is disabled

One can use it, like in C, to fully remove any item as a user, to make
an implementation a noop (so that callers do not need to care), etc.

Cheers,
Miguel

