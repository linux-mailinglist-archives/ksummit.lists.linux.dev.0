Return-Path: <ksummit+bounces-363-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A563C1BB7
	for <lists@lfdr.de>; Fri,  9 Jul 2021 01:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 962953E10C4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 23:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F36D2F80;
	Thu,  8 Jul 2021 23:10:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306970
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 23:10:06 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id l18so5319743iow.4
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 16:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rBlK2LgfCiccBiJB88gPmnOEfXZ2WxRLfjZj+FvSiBM=;
        b=jyvryrT52cmvxlZeCtRtaVeb5D5ENskg3tL5rLLy5Yy0kXljj3uvBy6FpqDek/fZ9q
         FqKgZ1CkcNa7e3JSqpZ5X5uDuR+vfLJDVNFH+JgkYpCpTgVtwrAqb361K29NT3g0v1mv
         owBUdRYNUbitC+onXPgUMheUFurxbofLEdlpBXE8ux2oaAHbdFoDSWucvHv2rpkW9ZoX
         dQO/+iIxjyq0jxxZfOCURw4pyCDvjXpdcWSLYsw2XsRV0+Z9L1fGHiD7KxTJmb0Y+dYh
         4XwgGnxF77VRYrwHdEWZQ5GhIa+7zkaNLLFLdF5OAjZQDBZOOn7KIqdc3UkKf9U39FUP
         4pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBlK2LgfCiccBiJB88gPmnOEfXZ2WxRLfjZj+FvSiBM=;
        b=W9y2z0JByCVOXa9LeWRcP7HyMiqaWu3pzI4RMlS/hn072HAXuv0T9cCN7WrAENDoaI
         ue78yrzGSzSyVb9SNTdzQBzdWNq1CnzXC+c0vKogM8PRBoAGYQgwN2kmqWKitS/ctY4x
         TtfoUNPHSqjSHazyLwAyFcA2/Vwz2ttEUhlK1BJ1zks6hdLBfoFhj69Md4diIfaOLomM
         Fe3FBbVMmYZwkBvYzARzL77X8c83+mqfScT8aSOCUzCSjRdEyEl25rZpN9Hr8zFZZJtZ
         38qgDmpHcZpQrajjMIjrjPRqNhY1xMzR6WhxiqQT73k1LcksMek6g8Vx5UsSIaHfb3Tm
         TS6w==
X-Gm-Message-State: AOAM533UbmKKo+lTjvxmILhfHqMCQeZb8QzEMFJdFolcoPMuJsjEaLgC
	sgb5XLwfCcB2ETrDPP0Q3in+1hbllIyULuwZjNA=
X-Google-Smtp-Source: ABdhPJzVsQ7JGTdLGxS8FDEoNwfZJ07ffbLdVXoLHX/yAp2xiZuMLbqMYjhzrCuLLx1EvEG7ejw351S7qiQoOekuwY4=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr25904104iom.149.1625785805401;
 Thu, 08 Jul 2021 16:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
 <YOcSo3ilu+ACDnBJ@kroah.com> <CANiq72mGRPqZEB2vTPxP4L5nNc-_0s2d=zCMi1BiVZHjPkeBnA@mail.gmail.com>
 <YOdHefpRd7isNrZr@kroah.com>
In-Reply-To: <YOdHefpRd7isNrZr@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jul 2021 01:09:54 +0200
Message-ID: <CANiq72nt7yD2kVjq9mUt+M5eVqfpvaPrZbaGZp1ftWJX3J7FXw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Greg KH <greg@kroah.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 8:44 PM Greg KH <greg@kroah.com> wrote:
>
> kref does not contain the lock, but you need to use a lock lots of time
> when dealing with them.  See my response to Andy for why.

A lock may be needed in certain scenarios, but that is because
something else is involved -- i.e. to maintain the refcount itself we
don't need a lock.

Let me give an inefficient, unrealistic counter-example: we could use
an atomic with sequential consistency for the refcount.

Cheers,
Miguel

