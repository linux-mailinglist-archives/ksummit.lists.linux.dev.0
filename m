Return-Path: <ksummit+bounces-300-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB83BEC7C
	for <lists@lfdr.de>; Wed,  7 Jul 2021 18:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8C0E31C0ECD
	for <lists@lfdr.de>; Wed,  7 Jul 2021 16:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0702F80;
	Wed,  7 Jul 2021 16:44:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBEF72
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 16:44:17 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id j12so3511688ils.5
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kz3DwLb6mbFBYRMgg/+0wZ0GNYlfQP2jBljrB49cuDk=;
        b=IgQdvKekc7FTVAhFxVTVPRwT6BIfxT7IfZLXsCi4OtO7DqgSd56piKEOLY4mG/tN3W
         dRIsFwPOcpZ8B6dOfuv/x4qLGKSppXCfSqUNtW9lMjKYqe0roYQ27PomR/ubCodUPj4d
         C8CgMzIOa/PijIgocwZjGfRa1DJapRKB68V0Bp3UEZXd1I9GSD4Dg8QcN7svpFw6Arlx
         fYKtB7eMdI7wUhUMjDP7eq3eII6wkEgT8/nodL/I+QRhzJrhVrUyUN5rjuu45LUuP0qS
         VaZ/PiX/NHiksP3VBB11wVBpK6zd/0+2uAx0zwWhiXw6xYd02jIJP0qjcB8/X2rnb4zg
         k/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kz3DwLb6mbFBYRMgg/+0wZ0GNYlfQP2jBljrB49cuDk=;
        b=jZlf3BRhTAjTyUTB7ceZuvUTuCE069ammg397LjLN5G2xmXiDKZZO/SA6muJYewnrw
         beklnOI5g1MIbCvoyPSR+RMxDXRU3M6DbeM5o/zQqoqZ75/bOfjYRIv0lBh2GPQ35XNI
         u9yDim/n9960W8p9kFlTmRfofUGMUQQf/VVWcTU2Q0ReXThfBr2u6yXmUfjXKsBAN9ye
         hLnZVX/l3rEeJwaXsiPn8gxhVTJutSXCqQZ/ccpHHhIrkygDHpy+GXX4s/TtdjhNW8A6
         m6kRDmq67ieVt3QDBrteSV9DbOG7zp5Zs44h+doF5rayLCt7sbQsXs+ZTINwz7NJhg3O
         i2fQ==
X-Gm-Message-State: AOAM530A/hGzvQMiSoTcrtMZg5/Wj57qulpzOlj/C6CzT1pMOaGxqFy7
	Zwt3TYSkDR9IhJA3/e4uIM4bxylrJQq42X672fnKw7Y6P5cG5g==
X-Google-Smtp-Source: ABdhPJyNcyPlorlKxbU6e++GX6wnXDhmbaQrcK6S8Ps92p2zXP/Q4dx5YjoqpwyvyasNsk4Jg8sDZgNwb05o0bNP2Fg=
X-Received: by 2002:a05:6e02:b46:: with SMTP id f6mr19721267ilu.94.1625676257143;
 Wed, 07 Jul 2021 09:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <20210707114834.64037813@oasis.local.home>
In-Reply-To: <20210707114834.64037813@oasis.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 18:44:05 +0200
Message-ID: <CANiq72nkNrekzbxMci6vW02w=Q2L-SVTk_U4KN_LT8u_b=YPgw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Steven Rostedt <rostedt@goodmis.org>
Cc: ksummit@lists.linux.dev, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 5:48 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> BTW, does rust support "fentry/mcount" code? If not, that means ftrace
> (and all the hooks we have inside the kernel) are not going to be able
> to use it? That's one big "notrace" across all drivers that implement
> Rust?

From a quick look, there seems to be support for `mcount` [1], and an
open issue on `fentry` [2]. Rust is based on LLVM, so anything that we
already do through Clang should be doable in `rustc` too.

I have asked our in-house Rust experts in case they now something more
(thanks Alex for the `fentry` link!).

[1] https://github.com/rust-lang/rust/pull/57220
[2] https://github.com/rust-lang/rust/issues/55092

Cheers,
Miguel

