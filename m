Return-Path: <ksummit+bounces-469-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD13D6690
	for <lists@lfdr.de>; Mon, 26 Jul 2021 20:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 80D8F3E033F
	for <lists@lfdr.de>; Mon, 26 Jul 2021 18:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15822FB8;
	Mon, 26 Jul 2021 18:16:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE932FB0
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 18:16:50 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id g13so17044917lfj.12
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 11:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncSq/wlJZ/WYpM/1KVRBcqKjL64SYkfd1uAlU7FY5PM=;
        b=RXWUuKJyndkGHJ9vhc0N/MXznTj0YC2YFZHaPZDZeh4Tk20t+fEYaUNZf2TutOfN+t
         XtDGIKtaawDuHCDdFtLIMrZiOuyuQ2OYRzPvJ3JB9FWoNIPU4JF4HtLh4eQnL+GFcJ0C
         CaU8y/XIC33PbD1KKm7tCpDR0CUBUwziRx8vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncSq/wlJZ/WYpM/1KVRBcqKjL64SYkfd1uAlU7FY5PM=;
        b=g6bbyOcwWtd0+3Rt89GKdAG6xa2v2PuxhkmfDTybOmGrDBQif9a0f7fRd6sOnbrMQK
         xObQ7V3NYymg8m/zeXHnuwNrbc1uiAWKXnSnyQAC+x15UQyHojB8F8cmoO7tslPgtDl8
         scdHARWQf8xBj22QkfwfSVEtmot/cOklaNQ6RecRFN4rbirx0AVP66cgQCoZtgIrimTS
         9xf7xmCpMS5KdMyXyVp/heQ5QMI/ws5NpmZUCoRW5vb0SiHFHF0HA7oZln6QoCqWPtUj
         kCttQ7KdWG+hR7igqXGFViEwTQ0a1hru4oj3SsPNS3Wd34y2RKVHINgjte5Nsix6iQCj
         ImPA==
X-Gm-Message-State: AOAM531NCHhf6sMuio8MjN/PPaTfAt/VGQYM/geP/lNkh8EiSs/Aw2ei
	sexNcENDyLoQaGPb6VzbL+rtZp9ebg8cutM6
X-Google-Smtp-Source: ABdhPJz16QE05oErnIE3vOa4y1RmLJfVEQWnmogadsLoBy3bmEFh50UX1UGAHnonbgqZflUQJ7S/OA==
X-Received: by 2002:a05:6512:3091:: with SMTP id z17mr13851740lfd.395.1627323408438;
        Mon, 26 Jul 2021 11:16:48 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id p21sm67228lfo.199.2021.07.26.11.16.44
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 11:16:46 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id h9so12390108ljq.8
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 11:16:44 -0700 (PDT)
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr12490916ljj.411.1627323404684;
 Mon, 26 Jul 2021 11:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien> <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
 <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com> <8ca1815230074c5ae31ec401ff533c0bf4baed92.camel@HansenPartnership.com>
In-Reply-To: <8ca1815230074c5ae31ec401ff533c0bf4baed92.camel@HansenPartnership.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Jul 2021 11:16:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh1-KNDZn38e7OFdkGCRmtAx=wVp0ZRSKHh6zioWoZV+w@mail.gmail.com>
Message-ID: <CAHk-=wh1-KNDZn38e7OFdkGCRmtAx=wVp0ZRSKHh6zioWoZV+w@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Hannes Reinecke <hare@suse.de>, 
	Julia Lawall <julia.lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>, NeilBrown <neilb@suse.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 10:55 AM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Actually, I don't think so ... we have NULL return all over the inode
> and dentry code.  It's a legitimate return for "I couldn't find what
> you asked for" or in the dentry case "I have no current entry".  The
> error returns are usually an explicit "there was some problem during
> the lookup".

Absolutely. We have several cases of "valid pointer, NULL _or_ error pointer".

Some of those things are not always about error pointers either. An
example of this same kind of "three-way answer" is get_cached_acl(),
which can return

 - an actual honest-to-goodness real posix_acl pointer

 - NULL for "there is no ACL data"

 -  special value for "no cached data", need to ask the filesystem

That particular case isn't using the error pointers, but it's very
similar in nature to that "this is an explicit error" vs "don't know"
kind of thing.

Anyway, gcc has this completely ass-backwards "nonnull" function
attribute, sadly it's pure garbage. It's not a "type of this pointer"
thing, it's a "this function does not take NULL as argument X" thing.

We could relatively easily add a "__nonnull" type attribute  (and
"__errptr") and parse it in sparse, but it would be _all_ over the
place, and without real compiler support it's probably not worth it
(people already don't run sparse all that much, and a lot of the
things sparse can warn about are too verbose to be be used in
practice).

But in _theory_ it would be lovely to be able to say "this pointer
cannot be NULL" or "this pointer can be an error pointer", but I
suspect it really ends up being everywhere and more pain than gain.

                   Linus

