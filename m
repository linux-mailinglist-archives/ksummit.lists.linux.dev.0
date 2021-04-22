Return-Path: <ksummit+bounces-36-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C3E3679F1
	for <lists@lfdr.de>; Thu, 22 Apr 2021 08:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 38F933E3865
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B542FA2;
	Thu, 22 Apr 2021 06:28:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F0E29CA
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:28:38 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id b10so44468186iot.4
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 23:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sV11RXeDVlKzrIuXP4IL78JlMTxQ6hzewrN1w6PHBTk=;
        b=U3QoPXmYy9VBqh6D/jyVArP7ufDnpqltfSIHOeZhve+uqmywdUrZ4YtasCmsv4psVI
         Fwv8TdrTeMv+nlOiEgzdg+pWTVqQZ6woWrcjwIvK9ZVdrR5yLYncHD7PU9zhjG9acuWA
         f/aO0Rd0xCoDjWM+iOV1cwowz2kvAHYadkVF+z/6SB0pD2kcyU44++Yisur6QVKaplYY
         X7QOl2W/u8U7mNKKNdI3iIo5K8Ri4y06lTtWIWc9lRx4f6eI2GxfMBQjcRIEn8KhvAow
         vlddAwgBat1z7YNbN83Y2KzFFXnRJ2FJHSgmbaNXsG5UiAlx4i30YbibUdvEXP6qaKgv
         EIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sV11RXeDVlKzrIuXP4IL78JlMTxQ6hzewrN1w6PHBTk=;
        b=hMg1bLfh+wX00pI/jw0UIdRVvzw/0NEcz3O0gVbObIoAUPOr5M2CCaSPTfUvEJyJah
         OnH3PePUK74VRWDDuXGTrvnAOFomcwBTxsRqJ/aPV0O0r/Ybi7GMDB/eFbkwG123FVTK
         Sr5C63wNcrqPCNbZ2U4kaGLdDAwogxE8A3H5iv9ooBcfg3D43dYq9GdabEsaBHz41EJp
         d6kHV2BYK4cpFMi/EWdBnwGXgAoZH3NCvH4upIdm+SodmBmRxG4zkvFBrN13RMOXBTtj
         jboaptKyv8+5SnU7VkhUEgltaFkHut68TSsE8iYsf9a6T415vr6b74EYt/eE/EMI2V9U
         hQeA==
X-Gm-Message-State: AOAM532Ned9NJjD3kfyTHPdYirh5DR8XIDYwVCRRidmgrQmIEwf8mY+Y
	Kwf66mh5Fhv16bZjZSieyD0mdlWIEvWKcixxf/M=
X-Google-Smtp-Source: ABdhPJxUdwUzogcX2ahtn8rsErB4y7OMEljNJuJNflGW1AwxlSDjhRuKTJv0bglVN8xv9S19Uo8tztZ1K9Z62Ei94ds=
X-Received: by 2002:a02:ccd9:: with SMTP id k25mr1790862jaq.29.1619072917526;
 Wed, 21 Apr 2021 23:28:37 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org>
In-Reply-To: <20210422055948.GA4171859@infradead.org>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Thu, 22 Apr 2021 15:28:25 +0900
Message-ID: <CA+Ln22HgpDk5=k7PhhVDdS5UZFZ7MMwTznXs-weqrmXzWYX8Cg@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Christoph Hellwig <hch@infradead.org>
Cc: Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2021=E5=B9=B44=E6=9C=8822=E6=97=A5(=E6=9C=A8) 15:01 Christoph Hellwig <hch@=
infradead.org>:
>
> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> > I also think there does need to be a strong sanction against this UMN
> > research group, since we need to make sure there are strong incentives
> > against wasting everyone's time with stunts like this.  Hopefully on
> > the academic side it can be made clear that this is not ethical
> > research - for example, why did IEEE think this was an acceptable
> > paper?
>
> I wholeheartedly disagree.  Demonstrating this kind of "attack" has
> been long overdue, and kicked off a very important discussion.  Even
> more so as in this area malice is almost indistinguishable from normal
> incompetence.  I think they deserve a medel of honor.
>

Agreed with Christoph. We are talking here about a critical piece of
the software that is the foundation of security of the whole system.
That we have a problem with the volume of reviews has been a topic on
various conferences since years and my experience is that it hasn't
really improved. As a part of my Chromium work, I often find upstream
code with issues that make me really concerned about the quality of
the review it received. Not saying it applies to all subsystems of
course, but not limited to single special cases either.

That said, I think UMN should have done this in a more ethical way.
For example, someone from the kernel community could have been
involved as a supervisor, to prevent things from running out of
control and ending up as real exploits and also to facilitate a
clean-up after the experiment ends. Also the fact that they are
denying this now is concerning.

Best regards,
Tomasz

