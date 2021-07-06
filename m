Return-Path: <ksummit+bounces-262-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277E3BDE07
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7526C1C0EBC
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06592F80;
	Tue,  6 Jul 2021 19:27:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18670
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:27:21 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id a6so101997ioe.0
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rfx+FGX24X5ueIuAbF9ya9XK3qp18BEcVw/YC8W0cPk=;
        b=bD58EdRtaJ9Un6jjD0MDUyKbxO1/GnOiBEANKfrxRcsfUGY0lqsdJUprN4v/CE1BjE
         Scy/4POm/fDg4ICvpbpfO6c6FxuZF12HCd3S0nGCrWqRb2UwRncmwPpuzUk51Wh1Jf+A
         maNCnflCg2Uq1m5In5w34HixTh6FSVkilA0y6BztdM5XdwdG62HKzVoxvrp+5DoBOKku
         A84Jn+EEzuyGVcoCkG0YQNwpXdvgZAyIMxU1j6SW1cZ9G6n4VlKAXgSIP+YRVqmi5pj7
         9MpqgMXo0r5BLVQ5PDFTmfHw0+hSAkvmBbV8m85SVgnkaFdtOdinV09E2Mv/TnqQ6p7D
         +yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rfx+FGX24X5ueIuAbF9ya9XK3qp18BEcVw/YC8W0cPk=;
        b=fCA8Y15jTdakpHqho7qd240yFJE6jWDQeuBZuWzFy/fovkcrg/peHgD2QspRgEdVwB
         JYEjWmHXfpEh+afxQsYd+PNJdr2sXpv71CMa9MF+qrKtYbxMnnE12xL8IQJsVvR60exp
         dPWDGtlSj1fXsvG5j3fEhKbGFddPIusYrBJlxAmnc5Rc1a1v/uZJS2TYPmfmxiQXToa5
         MQsRkpcUH+apTH2LWVHaKtdOX3s0Xw7e9R7ZsaLFNhteO9fB0PIp201yFtYxqJEAwoyb
         CgH4chsUN2nr+uvQ7sVHoBbwubX+cm2aR57tJJoCeoWyz8/WziCEMnpqfg4a9ktorINR
         y84g==
X-Gm-Message-State: AOAM530jmo2JYgV6VuKYu8avMoaOdqc8TMUvHr0oRdfow2BI+JkkIzat
	YbhD1o/oDhNyP0R+PpswGoPW/osO377RRlY2ezs=
X-Google-Smtp-Source: ABdhPJwWBD84/CL1e/YETz8U5EgqjzrPKJQq6Sd1m5IFXpajXKFlYZbU1816rYRS5aLDGXzF68vpeIS09Mcd8TfBQ0c=
X-Received: by 2002:a02:2b21:: with SMTP id h33mr1418054jaa.31.1625599640745;
 Tue, 06 Jul 2021 12:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <a23da43b-5ade-ef87-dd7a-392ed16ee7ec@acm.org>
In-Reply-To: <a23da43b-5ade-ef87-dd7a-392ed16ee7ec@acm.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 21:27:09 +0200
Message-ID: <CANiq72m3vvWntOpDX9+=fz_+CH-sbQjASp2Ncm5e8Cm8X5oTjw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Bart Van Assche <bvanassche@acm.org>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 9:05 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> Will the introduction of Rust drivers require that every maintainer of
> every subsystem used by Rust drivers maintains two versions of each
> header file that is used by Rust drivers - one version of each header
> file in C and another version of the same header file in Rust?

No, C bindings are automatically generated as needed.

What a maintainer would need to maintain, if they so wish, are Rust
"abstractions" of those C bindings. These are simply the Rust APIs
that are then used by other Rust modules to use (the "leaves"), and it
is what allows to maximize the amount of safe code in those Rust
modules.

Cheers,
Miguel

