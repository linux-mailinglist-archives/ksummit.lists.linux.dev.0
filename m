Return-Path: <ksummit+bounces-543-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF30408195
	for <lists@lfdr.de>; Sun, 12 Sep 2021 22:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 270CE1C0DCD
	for <lists@lfdr.de>; Sun, 12 Sep 2021 20:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33283FDA;
	Sun, 12 Sep 2021 20:41:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3BD3FD3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 20:41:44 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id x11so16471157ejv.0
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKjNE7bK3po+usjvgfBrD7IGk04iQOdNiTaRVWD8NGw=;
        b=Jn5KZZz8vDcU490qf49HpJHKmzekUt9QTN63ju6QgE3GF40+a01qXbpvIa3fawnYam
         AuCg/TIq3967fgBZn1lwFJGGNoWOQEUOFMqXS0Cjef9JXslsEZe+LhfuNYu9jRQT5Swt
         jqb8qh6M618M7YQDsjtIpuPIRBNkwxjX7vShLJpDBiqFoJeSNJcu3yzdZYdfGcnXJ8Oi
         55shUoJ/96Fn7l4LQb8ztb4/qkmmEQjFmg+q7XmJYQqwvRkohkxzFYmpFBSucwSWfEc7
         ZN24jTz/xF9AdZNcuD0eO5Ar5WbP7sL37jO9aZDq7k+XIlsQxhoWI1cws3MGyWZmSNtr
         dC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKjNE7bK3po+usjvgfBrD7IGk04iQOdNiTaRVWD8NGw=;
        b=s71kTfy1+DSuzqz6ineZvlO08t5vmAqolFSA8I3H2C16X/wtmnR0EfN9X9D1b8ztbN
         AajRuK+jBXPE6nfcnqEHZ0/EJvuRGb3jZxYdbXMKdamUMXMQn/PY5QtCzYZXuljP8Slc
         1+POi4rUSxwM0ahpVkSbEPPEwwD8eq1wF/1E9xvozi68pN/nhUr0tZSN0cjtRhYGi9Ip
         mEBjo+cE2lgNwjxR0pM4wdrnH5QSMylF9w19+seBZxLsz3DvAJiVZ9zS475nGFkjkAcV
         FkPkcDzPLLgt7Ke4HAM1FI2axNkQA+dGIUVG+dU1aw3pImYvRTpl/FFBMtH4hN3lqbLl
         ehPA==
X-Gm-Message-State: AOAM531QtDwPjuKZbNKv/BRkOPYiA0fv1fW+t0iZP5ASgfYJmeQ12gLg
	VWLs1rWYMPtEAaiIU/Yh72eYw7tFiXRQToCHKTI=
X-Google-Smtp-Source: ABdhPJxAQH5UZy31S/0Xa2UnUpXPwqH0za1/K6eAjC4G3DulW6fUgr0eT4B2ZeX0pC7znI09GSY0wzJO5GgQFkBrBzA=
X-Received: by 2002:a17:906:5685:: with SMTP id am5mr9417912ejc.64.1631479303012;
 Sun, 12 Sep 2021 13:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87ilz8c7ff.ffs@tglx> <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com> <YT26ebT6xXWsnVMw@unreal> <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4LgkK+ejUWljEh@unreal> <YT4QCHwnqZL/rl0z@kroah.com>
In-Reply-To: <YT4QCHwnqZL/rl0z@kroah.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 06:41:31 +1000
Message-ID: <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> So will the IB patches usage be re-reviewed?

https://lore.kernel.org/linux-rdma/MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com/

FYI it's a thread where GPU devs reviewing IB dma-buf patches, what's
next cat and dogs living together?

Dave.

