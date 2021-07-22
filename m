Return-Path: <ksummit+bounces-440-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA53D2155
	for <lists@lfdr.de>; Thu, 22 Jul 2021 11:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 053721C0F05
	for <lists@lfdr.de>; Thu, 22 Jul 2021 09:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0720D2FB6;
	Thu, 22 Jul 2021 09:56:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73031168
	for <ksummit@lists.linux.dev>; Thu, 22 Jul 2021 09:56:42 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id c197so5933946oib.11
        for <ksummit@lists.linux.dev>; Thu, 22 Jul 2021 02:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YR1QprgrY16a+8y3JexsV6B8Rz5MQoZY3EWxYKUMXNM=;
        b=W3OHSwntvrzae0sULjZHKV0PgFTypuJL7Ep6uULr3dgoj7MMNC2kBmRfn1quGuKW/7
         lKIaIb5NsPJMe29Z3cVsLSG/CkfpHAEV2bAl2Ofp3EWKD2rVqJrh6Q87ieXEHvSW8IoD
         IzXaxu2rc2uTFGw/z0bsntVnK3TGO90FnNZ0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YR1QprgrY16a+8y3JexsV6B8Rz5MQoZY3EWxYKUMXNM=;
        b=nfLFhDPQymEKGogGNGI90A6mE5CnvBVn8L9ttA6NVKluOtlOHh1Kb1PFpRRy/Z8pLY
         KH7UW3ute72dAJzZjeLe1ybSRZXfIs0K90V0nVFRZ/BmTq8STMi5oPg1S/uqTkYoqyjq
         trjYB/eVxAYsMTAmcmErCFCFSE/tje6aOIZK+uXFIGshQutc5NW7k8Pbe7ZFlRuLoSCP
         T3jNUvtqMttBu9cZqkJRHykxE04ZFIiYl65Z2Vu+flgm3oKw77TDbLFFewGcozU4gbRU
         ESYxBrGEuuakUznVLzamIdznT/xY7LjX9DBGrg7+GZNN+9vhDl/D0/4fCaPGVL344B3r
         J0yQ==
X-Gm-Message-State: AOAM533doCJLGrFaTlPOAm2ojfIz9+OWiVuL9IwMIq7mNgxEYfOAhL2d
	d+YHJZWkUTWAcTiZagxHwCoE/y00G8nc/TrNrf4tRA==
X-Google-Smtp-Source: ABdhPJxLx0ytvONlnHXS0ZPWlAPGr2/0aSruvx1tonFO65CHDFSWcwRCscUjtZ8ExhPnuFIXdir1Rc+9YE7ROlh90q0=
X-Received: by 2002:aca:d682:: with SMTP id n124mr133393oig.128.1626947801258;
 Thu, 22 Jul 2021 02:56:41 -0700 (PDT)
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
 <YOagA4bgdGYos5aa@kroah.com> <CAKMK7uHgtGc9ncD3LjHzWxF1eOJ5-M+u=45ZG8-vDtgEAHVJ4Q@mail.gmail.com>
 <20210721090841.GW1931@kadam>
In-Reply-To: <20210721090841.GW1931@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 22 Jul 2021 11:56:30 +0200
Message-ID: <CAKMK7uEJjx5kLMcAPOnnu=SamwwikEyO5fMirS0rAxGwxrLwmA@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <greg@kroah.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 11:09 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Jul 15, 2021 at 11:54:22AM +0200, Daniel Vetter wrote:
> > Since we're dropping notes, a few of my thoughts:
> >
> > - Personally I think an uapi resource cleanup system needs a different
> > namespace, so that you don't mix these up. Hence drmm_ vs devres_ for
> > drm, and maybe the generic version could be called uapires or ures or
> > whatever. It needs to stick out.
> >
> > - I'm wondering whether we could enlist checkers (maybe a runtime one)
> > to scream anytime we do an unprotected dereference from ures memory to
> > devres memory. This would help in subsystem where this problem is
> > solved by trying to decouple the uapi side from the device side (like
> > gpio and other subsystem with simpler interfaces). We have undefined
> > behaviour and data race checkers already, this should be doable. But I
> > have no idea how :-)
>
> So you want a warning with code like:
>
>         p->foo = bar;
>
> Where "p" is devres memory and "bar" is ures?  There are a couple
> approaches you could take and I would advise to implement both.

Pointing from devres to ures is totally normal, otherwise how can you
unregister your interface (drm_device for gpus), which is ures, if you
don't have a pointer that you can access from your hotunplug code,
which leaves in the devres world. Or when you're called in any other
hook from the device side of things (callbacks, interrupts, whatever
really). The usual approach is to clear these out on hotunplug, which
doesn't need locks because you're guaranteed that nothing from the
devres world can use them anymore since the device is gone. But ofc
you can screw this up easily.

Also, you need to have pointers from ures to devres world too, because
without those it's pretty hard to access your actual hw and make it do
things, which is the entire point of exposing a uapi interface (which
is in the ures world). The trouble is this access isn't protected
against the devres side disappearing in a hotunplug with a lock or
barrier or similar.

E.g. in drm we have this drm_dev_enter/exit stuff, and within that it
should be save to deref from ures to devres, but outside it's not.

> The first approach is to just check directly for if p is devres and bar
> is ures.  The problem is that sometimes you won't know if p is devres so
> some bugs will be missed.
>
> The second approach is to say something like if we find one type "p"
> that is devres, then let's assume they all are.  Same for ures.  Then
> based on our assumptions about types, print a warning if they don't
> match.  Then go through the warnings and make a list of types which lead
> to false positives and add it to smatch_data/kernel.ignore_devres_types.
> This is a bit hand wavey but that's basically the approach.
>
> A third approach would be to do something with manual annotations.  You
> could probably make Sparse work for something like that.

Yeah I think a classifier like that makes sense, but I'm not sure we
can get at the information about how it's protected statically.
-Daniel

>
> regards,
> dan carpenter
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

