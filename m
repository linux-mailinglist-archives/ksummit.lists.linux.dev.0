Return-Path: <ksummit+bounces-336-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C13C147D
	for <lists@lfdr.de>; Thu,  8 Jul 2021 15:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D57311C0EE4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 13:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3755E2F80;
	Thu,  8 Jul 2021 13:42:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09886168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 13:42:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r11so2336143wro.9
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 06:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DjehLGU7YKqiX2h8Wxl3Q3N9HAHKgv86j/oohJJDNFY=;
        b=uRU85sta3UmmIU70UjjkauZnM6ih1hrsdWTPCxl1kS2+CBCREY2HYXDHdef2xTk8eQ
         hNvJMLKnHsGQ7yjib0yJReE3Yz6yX3zpOkVduWkaugjEDRnJvv1F0FZ34LbEyafwaQHn
         29FhPW0F6xUbo9u5V4PmJvENW4Byc5S9fJPnfO/0uVCW/mx9NFk2njhTEnYAeTU7TYQT
         hxdkCR+U4I3/4yY6s/Ykw7lhTvfAvm25BrRfeSG1vslODgv6onsCrX4yUeNBujOcb09W
         VYPu2iIaJOil3b+Io5RNT9nagrtJYmlr+a+Giu8ZOnqpBvVL9Lv1WxgPwJaw2KNol2CO
         R70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DjehLGU7YKqiX2h8Wxl3Q3N9HAHKgv86j/oohJJDNFY=;
        b=HIK7dyDajyOLOrOdtMPpQB03tDTUKY6iK048cynX/Qonv0orpZzzGZ95UM8KOoJXXb
         ev1XnL1BRtxDvnRrijdOl9dLlY52Elkgd1zb2NIFvVyvHJFYUpQNR+3HnO0EbCb5Ehp0
         u/N2VgyqpcIo/9l6kARMMP8lOuXdHb+ckuVrH0bug1ZSJ1O4Rmv2DRC0dbjgDHfuyc8h
         j2ODqjT7GLdcR/sYDtXjf+2HRKfqVCZh6TJ/7cTJOZurNOU/avICwEmgzu8V7QCE9KoS
         fVIRQyOAekDixcQrcuAUJequ/mMgGheRw2u3yQwx1zE7hP656DWDr40YmRm2ZRTMMu3M
         I3qA==
X-Gm-Message-State: AOAM532K8WkZmS8LFsSbNPsr0/3qNGAn+Tlc9Qa1C92+ZUbD1ckHuijQ
	P3fC7YGIYH7YoAUuUCo3gR2D
X-Google-Smtp-Source: ABdhPJy2aQq8j0N68324SYs0TqGNVfFYfigrK0WzT5AIFVvs+M2D7UH4Cz/0sTeStS+EIf/9b6jwnQ==
X-Received: by 2002:a05:6000:1c9:: with SMTP id t9mr34529899wrx.330.1625751720251;
        Thu, 08 Jul 2021 06:42:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:a098:e45d:317:5eca])
        by smtp.gmail.com with ESMTPSA id v11sm2292176wrs.4.2021.07.08.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 06:41:59 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:41:56 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOcApBj/puXe3Yig@google.com>
References: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>

On Thu, Jul 08, 2021 at 09:20:25AM +0200, Geert Uytterhoeven wrote:
> > Weak references need to upgraded to strong references before the underlying
> > objects can be accessed; upgrading may fail if the strong count has gone to
> > zero. It is, naturally, implemented as an increment that avoids going from 0 to
> > 1. It is safe to try to do it because the memory is kept alive while there are
> > weak references.
> 
> What does "may fail" imply?

Upgrading is essentially calling `refcount_inc_not_zero` on the strong count.
It succeeds when the count is already non-zero, it fails when the count is zero.

So "may fail" here means "your attempt to upgrade came too late, the object is
gone". (The memory is still around so that attempts to upgrade don't cause UAF,
but the object is gone.)

