Return-Path: <ksummit+bounces-374-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A493C28AF
	for <lists@lfdr.de>; Fri,  9 Jul 2021 19:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4848F1C0E55
	for <lists@lfdr.de>; Fri,  9 Jul 2021 17:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C42E2F80;
	Fri,  9 Jul 2021 17:43:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C2472
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 17:43:21 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id h3so11139249ilc.9
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+C1NV/FCPhoq9A8cb5BXXKSQuLfvCWLsAKBHEk0qIn4=;
        b=W1eArvP88Wvb2x1xrn1RgHnfg+fMYQO9N6akZx2uIS6k6aFMWx8wjP/shljA4EReI3
         25Si63/X+D5UinXxr0CTldtV8PG4BuoiVhSzgZjJambZLEoRJOFnLISYo8jK58fjfiLh
         JvypSV8UMaAE5VWpD4LPlpaYjAx9QP2hJlDl5QTrYQ53QvdCaAf9ksoRdFVIaT/w5PIC
         2ZwUz/CJonD6GKCq48rSjpR12YWGgrL9PYl6GJtKMqoc1WeCAVdnxQ20SKRksqMSFG8q
         iLBMl8k1VTsC1IUkU7sDNbAJNYeMBqDksPvzf/9y4tHLqEeBUfruG2CBHXpAoSPCz0AO
         iIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+C1NV/FCPhoq9A8cb5BXXKSQuLfvCWLsAKBHEk0qIn4=;
        b=XfuDKELUqGk+CqNUi6B64aze7kMoqbvrFYRFohlR+th9dZZkWJHGquyzIHchd/5xw1
         beqYWyuf4MGwg1cESDgFSm9n0AbkXjqXT5FudChireRds85UaON3o6VWk60cti/Ki3El
         4AUrpzyVV13a7VTpjrLh37offNu8N38whNpSO42AUetvjKpwVV08sU/hpxIb8LdFwHyV
         7QMG2RIV+OOJ/8KiZxthI0VJXxoLZwycaVmwvDdQ5mHG/lZHgnQNaWbM5ce7g5VqiP+/
         Gf1SZkvuIDG6fFUnf+7M/cmKfuDxawqSUnlrETvfRyfoqQy/910MtV9OWhqPpRCF85Wr
         GbBw==
X-Gm-Message-State: AOAM530iqzRS2kKk+IabuWUgJuyT6f4k5mDf55D+Ijob7ZKQDfY0sXd+
	JKFwMrAa+aehzaHtUE52SQKEyAJ6FWl9dO4TlQA=
X-Google-Smtp-Source: ABdhPJxDU0iyc92odPRsEU4sSg1HQi+lLJu/lTADwnT5ONnkVVncSB9ZCYpKY5FPGnhCanVzf9UULr5y7OFNs1Q3R7k=
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr27680596ilv.176.1625852600656;
 Fri, 09 Jul 2021 10:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <20210709170649.GD4112@sirena.org.uk>
In-Reply-To: <20210709170649.GD4112@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jul 2021 19:43:09 +0200
Message-ID: <CANiq72=gjOZsy8NMw-tUSjhfeAnBTot59d0NoCO7sY3h=YTRrQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>, esteban.blanc@epita.fr, 
	martin.schmidt@epita.fr, "cohenarthur.dev" <cohenarthur.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 7:07 PM Mark Brown <broonie@kernel.org> wrote:
>
> SPI might also be interesting here and I think there's some SPI
> controllers emulated in qemu, though no idea how well or specific
> instructions for any boards.  There's a bit more concurrency and so on
> stuff going on in the framework.

[Cc'ing Arthur, Esteban and Martin since they have been working on SPI]

Cheers,
Miguel

