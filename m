Return-Path: <ksummit+bounces-312-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795E3BF121
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 93F361C0EC3
	for <lists@lfdr.de>; Wed,  7 Jul 2021 20:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985002F80;
	Wed,  7 Jul 2021 20:58:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A178168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 20:58:57 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id l18so454871iow.4
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gHFc4+0zFtEDK9o/0UC9ep6gO0PlVmpeiAjlwnNkVo8=;
        b=J1M4d2gXwavu4eE9ppE36TWhykhdZkl8ECNafjHg+5xuJQB7xzuzGWVQQObfYhC1kB
         2zH90hhr0TBcdcN/eH4Jyx6/Bj8XPeZIPfpOCu27jQN2p0rqYfbG7LC6sKyx+NYSgpLG
         4eo8gIDkXVZsU9z7WtG1RAhYm5rkSplg9X9H7dKAS1NueJxwktYRX2/yZrce8M7Lkit2
         Yrs3X7DCxy1ywA00FIZ8G1hjQKrASOUuC176Z8aJ+rJZHmaWl19swQxzJ1aDCwgY4QKM
         tbJgJRc6DlAdIOBN9GOIj/M3k9QjHUn5Obj3MDSdNNbAleOdpvngClBvije9M7sajbOE
         OulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gHFc4+0zFtEDK9o/0UC9ep6gO0PlVmpeiAjlwnNkVo8=;
        b=aq6VF/EqeMCPJEvRRUKdzUs0FE/Z/CLVMsl0GuReoUC15Ka4HBqWL9Ejt8KGA5MOy0
         CTfTZOjd/XkVzlaZMsdwO81Dkvb/YJz4107sxFFPV557ttT+v/kFmTvYxbxjx/ezU1A/
         od5GN9ywoIOfIsB3fAKs+Y4ojIFpwVp2OnCjzl3y5ZmbnGNc8ISp93UwUhBBsN02r1KO
         p5mG2BBwG+BrYx9wNiPhOY67tyglAcbAHv6JeRnTn+raYqogi7bqM1p88F3DH2v1QfID
         nhw5rQ53i/BH5I6xt1q3cb/TBEJtj+5HfIP5t2FPxTfNlcS/gNx3RNzWF48j8YVhOtwg
         92dg==
X-Gm-Message-State: AOAM533GEhDpI410KGVXglaWnhfw7vpHVWEHpDs1YJO2EWgfWQwsudkt
	AVcsAtm1uqV2Qwj9HD9lcsJgVil0enXwCm/kLRs=
X-Google-Smtp-Source: ABdhPJxmowSx+KJEU18UYNOskFKmZRKVBdDd5f/H2kOa8idYnDOi39AjuirZ/uI5P0lA8z1ePuToVDbs95T0Tpl14SA=
X-Received: by 2002:a02:a310:: with SMTP id q16mr24063079jai.8.1625691536771;
 Wed, 07 Jul 2021 13:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com> <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com> <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com> <YOXibDV8mHT1e6ec@kroah.com>
In-Reply-To: <YOXibDV8mHT1e6ec@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 22:58:44 +0200
Message-ID: <CANiq72mWvniSwhEKLqkfRboFr4=r8k3pSAXg5-SyW45e4Ch27g@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Greg KH <greg@kroah.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 7:20 PM Greg KH <greg@kroah.com> wrote:
>
> That's not what I meant by bringing up a kref.  I was trying to ask
> where the "real" lock here is.  It has to be somewhere...

Given this sentence, I think I understand where the confusion comes
from. The key is that `Ref` (`Arc`) is not adding any thread-safety to
the `T` it wraps -- it is only concerned about providing
reference-counting semantics.

For that it only needs to keep a thread-safe refcount for a given `T`.
But the `T` might be (or not!) thread-safe. Since the refcount is an
atomic, that is enough for implementing `Ref<T>`, no locks are needed.

Now, if you need mutable access to the content of an `Ref<T>` that is
shared by several threads at the same time, you need something extra
-- that is where you would need a lock. For instance, in normal Rust
code you may see a `Arc<Mutex<T>>` being used.

The big thing is that if you get any of this wrong, you get a
compile-time error. For instance, if you create a `Ref<T>` out of a
`T` that is not marked as safe to be sent across threads, you get an
error when you try to send the `Ref`. Or if you create a `Ref<T>` and
try to call a method that mutates the `T` across threads, you will
also get a compile-time error. Thus you cannot forget to have a lock
if it is needed.

Cheers,
Miguel

