Return-Path: <ksummit+bounces-385-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933C3C6CC7
	for <lists@lfdr.de>; Tue, 13 Jul 2021 11:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1E1E93E0FA1
	for <lists@lfdr.de>; Tue, 13 Jul 2021 09:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2EC2FAE;
	Tue, 13 Jul 2021 09:00:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2290972
	for <ksummit@lists.linux.dev>; Tue, 13 Jul 2021 09:00:07 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id a12so3902782lfb.7
        for <ksummit@lists.linux.dev>; Tue, 13 Jul 2021 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auooqGend/MpgDzrAxPulB+LTrlAKF1M6jC9r1DHfm4=;
        b=YewyrC2cjM63ymEp0Y0p663ELwRfw/RHQwzpyR0GigFKynIrn8GTs3GlKlRv+BQZjh
         g23GoCFQEYrTIJWAsb+qPxppLienpkZgWOKqoGv6APbWQ/9tyPQbd7+r0FS4TO6lyY39
         ruA3lQyrz15qRLLqrYcqFJWgJYupBQsgTprw+WTn8+QDJ9SaceCUvtyy7KKrfgaaZURE
         a1yQAKmq2gcz1nH4B7/0DXtqG/aDPpw4kNsdrQraLIBeYQeACZRTuWmFrlu6LVcpPbfJ
         pNMDj2gmz4l7ZRWVo9IbrZdTpG9G14YjauihkYxtUXsFD/DREw2bZoSXNQ9L30zSpO6U
         SW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auooqGend/MpgDzrAxPulB+LTrlAKF1M6jC9r1DHfm4=;
        b=WmMv+iHZfQRSyLUP+9jaGYauJJod+7xy3XeaG5Klz4mtWVY/KJMIqpRyK/YjgtfjD4
         Eaw1KwDFHNGSzogstKPCpUrTtYzpeIdSaAQH5wlLbefD8puIuDqO8NHu9JeslcFr4b/S
         t4HGNlFE36fvWMYexERO0Jyim3zu9Bt1OpsPPv91y2oGzAXyi0hPqt1I4jo3YDsjyUcC
         3hkpfPLQ07N8rTC5mGEJx8dtLyg5ntCqfqYb0oVn4BEI8ICknWzYAbgGVHp5Q2XXl9xy
         zDFzPk5dgn3jvHoYM2VssxDimC5x7wuDtlGBOMQtWk4nbr/ih/670BCGbgCaM56+0nsk
         yhVw==
X-Gm-Message-State: AOAM533oxI/oFbuxbSY3A6MJuyKOZqsmLsqz73Yaaug9Xp5sSCQoZFf9
	ihPxQwqc9CAMkKdcxVa7tuiq3CE3P4pPjOVuY1mzNA==
X-Google-Smtp-Source: ABdhPJz5BHsQ1V41B0ZOTtW9XeAJmBUmOzSB8o4bj4ZLB02n7lL8RL7XfT5Kjqw569hfnGdCOJXWkoXLP8XavixQNaY=
X-Received: by 2002:a19:5018:: with SMTP id e24mr2816820lfb.29.1626166805038;
 Tue, 13 Jul 2021 02:00:05 -0700 (PDT)
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
 <YOh/JC//dotfm5J9@google.com>
In-Reply-To: <YOh/JC//dotfm5J9@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jul 2021 10:59:53 +0200
Message-ID: <CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Greg KH <greg@kroah.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Roland Dreier <roland@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 6:54 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:

> In preparation for writing the abstractions to implement a gpio driver in Rust,
> I was reading through some of the code you describe above.

Nice, bonus review :)

> Unless I'm missing something (very much possible!), this "numbing" seems to not
> be synchronised, that is, there are still race windows when userspace may cause
> UAFs in the kernel.

That's possible.

> For example, gpiochip_remove sets gdev->chip to NULL; gpio_ioctl returns -ENODEV
> if gdev->chip is NULL, which I believe is an instance of what you describe
> above.

Yes.

> However, what ensures that it remains non-null?
(...)
> I see that in functions
> called by gpio_ioctl (e.g., lineinfo_get), gdev->chip is used as if it were
> guaranteed to be valid.
(...)
> Is my reading correct or is there some synchronisation that I'm missing?

No there are definately possible synchronization bugs there.

We probably need a few more
if (!gdev->chip) return -ENODEV;
in some of these callbacks for example.
There are probably also more narrow possible sync bugs.

They are a bit hard to reproduce in practice because people do not
unplug their GPIO devices so much, the one case that is used a bit
would be USB-based GPIO expanders which happens on e.g.
serial dongles (FTDI with additional GPIO is the most common).
These are used in practice for controlling lab boards and stuff
but when people unplug them it is usually part of tearing down an
entire setup so the circumstances are a bit chaotic and subtle
bugs are not noticed.

Yours,
Linus Walleij

