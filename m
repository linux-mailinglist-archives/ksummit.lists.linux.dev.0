Return-Path: <ksummit+bounces-436-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD593D1049
	for <lists@lfdr.de>; Wed, 21 Jul 2021 15:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AC8A01C0EF7
	for <lists@lfdr.de>; Wed, 21 Jul 2021 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5B52FB6;
	Wed, 21 Jul 2021 13:54:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48B72
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 13:54:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id m16so3237274lfg.13
        for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lAIvKEyDTGsY8KXwf22aaxz+SBkKUMVMit8SG3rRrS8=;
        b=Q6geRSumqYVpwIdFAQATE/8ocaRfgzs0eZPkhlqA6A1Wb7ZI5C+94qKwBnl+ELgbTn
         fVNqMRfS8schc8YDINHAuY5UCbN6Ins7I17VIl1NX4B+GBHhQMaOcn6+mVDbbyTGmza+
         6SPW6tvBWMrrH76/Xxr28xV/Qdp3E+c2FukN/RPXUI/FF2v/WafBozeUDzG1rEZet1Gm
         GetXfdMkvlgcP1PGIOHaimFQHWY3tsrOwI1JOpdro/XnzbPQxey/UnUVQlo6g3Blx+cK
         CBpF0GK+CwE2PW9e7qjYBKDDQdjCCRJV/PZruP97YvkKLGXYEA8dhU5D7rfUK3pootFI
         E5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAIvKEyDTGsY8KXwf22aaxz+SBkKUMVMit8SG3rRrS8=;
        b=sNPoR72G6R39ClfM9MMUhRBLx7kGu44p1K06wzsjpUxB0xxcmQvd95Q2VAVssfuTno
         AkFlPO/NSIbWieLhFLS5yDHpli2fieSMSRMEQ0+hBL+5Agy8tef7AQfOm3D0tsIOwgja
         f2a9ZeRk9PCBZFmYun9Pw4aSQojuLREEc/CcNEfd72+VMtvFjDg5shh8lP5ca3Fftk7Y
         zzPUXXYC9Yhyu0o8BlVdF/NPR0lvFSvryHHD8iy+WkMnStDz6lLkWXPJcrbZ9VgVhTYh
         oz6S6cMzQNiBCdBJbaMdqK3kahbHAoai92k3yHaZhuNtliFxXlzpxbD3smbhg0w2/ypz
         ahCA==
X-Gm-Message-State: AOAM53312KRY2gqgsbNu+P8rNWpABOPDo0Jz8ojh7gv07M5Xcc+FhFla
	Tm1ZE/8MQRS/DRBruzCDkNSSSFba9YDxOdY7ch+6+g==
X-Google-Smtp-Source: ABdhPJzoymqIUGW+th+hijBxUz/3eCBQDcWb6btVHCDhaGPiPLWDFexwX18rFNkbLhJQO9ynbdtgI9KJ/fOoRRy8HyM=
X-Received: by 2002:ac2:5312:: with SMTP id c18mr24927032lfh.649.1626875685541;
 Wed, 21 Jul 2021 06:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com> <YPW/LNwxwEW4h0GM@google.com>
 <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com> <YPXqGoTWprjpslbP@google.com>
 <YPdiMHr/t5K6RJck@pendragon.ideasonboard.com> <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>
 <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com>
In-Reply-To: <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 15:54:33 +0200
Message-ID: <CACRpkdavy-fg30tfDpJthuU1WOeLTLJ4bbuKnG+Fgkx-tgRStg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Lutomirski <luto@kernel.org>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 3:42 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> [Wedson]
> > Preventing functions from being called, when those functions are
> > scattered all over the place (sysfs, etc) may be hard.  Preventing
> > access to a resource seems much more tractable.  That being said,
> > preventing access to the I/O resource in particular seems a bit odd to
> > me.  It's really the whole device that's gone after it has been
> > removed.  So maybe the whole device (for some reasonable definition of
> > "whole device") could get revoked?
>
> I agree that we should view this from a resource point of view, or
> perhaps an object point of view, instead of looking at individual
> functions. A GPIO driver creates GPIO controllers, which are objects
> that expose an API to consumers. In most cases, it's the whole API that
> shouldn't be called after .remove(), not individual functions (there are
> a few exceptions, for instead the .release() file operation for objects
> exposed through userspace as a cdev may need to reach the object). What
> I'd like to see is the subsystem blocking this, instead of having
> individual drivers tasked with correctly handling API calls from
> consumers after .remove(). The correctness of the latter may be less
> difficult to achieve and even guarantee with rust, but that's solving a
> problem that shouldn't exist in the first place.

We have something like this for GPIO but it is coded by a notoriously
crappy programmer (me) in C, so there are some bugs in it pointed
out by Miguel.
https://lore.kernel.org/ksummit/CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com/

Yours,
Linus Walleij

