Return-Path: <ksummit+bounces-1559-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78201973C9F
	for <lists@lfdr.de>; Tue, 10 Sep 2024 17:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7A81C25602
	for <lists@lfdr.de>; Tue, 10 Sep 2024 15:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF72619E7E0;
	Tue, 10 Sep 2024 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsGw9rDK"
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9524B2AE69
	for <ksummit@lists.linux.dev>; Tue, 10 Sep 2024 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725983180; cv=none; b=jJ+HjF/G3lixq9Muu+rL7ua5lLX/UQrK2hK5CKBoR1ugvCBdauLk0lTGtkwS5t3HKNIml+3G2YWdzd2v0L8e9lO5rRg+pX6voB+XTeL3CZGNWkoeH33T32gGmjpynKl6kT4WHGUmPaqkft2X0tePD29WvhtC/42x0muvsjwB9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725983180; c=relaxed/simple;
	bh=PfLuDxAAz2M5ybmKEUuxn4Axdp+6CXcJWD7ZW/HU9X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwuqXCs5Z6rBNK3NZGoZJtG4XMlAYt1USgHiQwYz2FgAP8PdDeCpEY57Qyex9DtfP5ybQvjmf+RxtQJ7f3ssgxCoG4zHioA7IfP4WTQXOd/yeYweBACWq/spKQOhp+6ouCQZhzrU10P258go8Pn1H751TO7H3PC9+ZK5LeRYWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsGw9rDK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53661a131b4so3894484e87.1
        for <ksummit@lists.linux.dev>; Tue, 10 Sep 2024 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725983177; x=1726587977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfLuDxAAz2M5ybmKEUuxn4Axdp+6CXcJWD7ZW/HU9X4=;
        b=TsGw9rDK3l5jfs4uutOfLDhNdoNjdSFCHTy/D3xmsxgbGcVu+X7FeQcsI+JrtOvePV
         6uxaI6cYRMyzTELs6dvrwwpgSAZOpQzxm//TBsPJ9ajXB+ocqSZ8niFjwlPh1js+dqcP
         r4outLUy2mmIkAa6TiClGua3X4nSQ2Qd2qHiDDpRYfMaT8Q/7ki0AcTdwJeT9iR1N+qp
         6Sh5iWfqIao6wksh34y1oE4YwGXrli3TzhT6KHpD7fXS4UwECCETwUFCUL9twXI3qeMW
         wIjaBLYmp1fVpigoF019YrUolRtBXMN8+UbYXd6tcGuB66m7MjIw2HPib2iGD1CgvNW5
         xtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725983177; x=1726587977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfLuDxAAz2M5ybmKEUuxn4Axdp+6CXcJWD7ZW/HU9X4=;
        b=j0lbg4inDsXc07bDKgcPtG8FJ10eFIWgnTQ6tQsE1w0eydzahhH0qeIft/Pa4oLZEn
         kWMEVEaevZUmCrD9aQe8tZEihRf/L4oPpwbV4+Rhro30lfCWCqOR59QfQCUxOXWB9uzt
         QoK+vFomBYNDccx29MwwzveTQhv7RgQYiRP1gc3JI1pXmnbgd35iEgZFxUPzPC9nVcRW
         /8eJhoZ2T1Atjbsmxs1iN1bQg2NKJEy+oyUgsnUmxi5p4zyrVPtNwFFQXjO4uYuuSXFN
         om+/etSrIVaDuHO1znWqFpi+eHfXwCCnbrUUyIo9IIWePrx8K3UBjTQclD3CrFC7+cHW
         MfUA==
X-Gm-Message-State: AOJu0Yy6siyc9K8bAVV2vhJ9e8Y99uw+IQMwWx41t0xpMU2gXr/PZLuo
	+Xl95bdUp3j10xuurARTo35Ato+7JCwe8E8ZhaeRAVNWW6xgqUNtxKZNSpCGX1f8wZMNvvopo/L
	I4dv5Vfu3FcnhkXH+Ytjdo+3fHA==
X-Google-Smtp-Source: AGHT+IG/KYZIksA+p7DluaWPkEGs258gFWaWGnstOF+Oi5M89W7dI/CPamEuD3rTnBvt3Z9oYWQaVJd70YEdCDQgMCU=
X-Received: by 2002:a05:6512:398d:b0:533:4652:983a with SMTP id
 2adb3069b0e04-536587cda61mr8741912e87.35.1725983176233; Tue, 10 Sep 2024
 08:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
In-Reply-To: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
From: Rob Herring <robherring2@gmail.com>
Date: Tue, 10 Sep 2024 10:46:03 -0500
Message-ID: <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 5:53=E2=80=AFAM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
>
> Hello.
>
> I maintain the MediaTek DSA subdriver and some devicetree bindings and
> source files for MediaTek hardware.
>
> I am especially interested in the best practices of maintaining dt-bindin=
gs
> and DT source files.
>
> There's this false impression with some maintainers that, as the
> dt-bindings and the DT source files are being hosted on the Linux
> repository, Linux drivers have influence over the design of bindings or
> fixing DT source files that did not comply with the bindings.
>
> I'd be very interested to be involved in or kick start the efforts to tak=
e
> dt-bindings and DT source files out of the Linux repository into its own,
> separate repository. I believe, this would be a great step in addressing
> all the project-dependent bindings of Linux, U-Boot, OpenWrt, and all oth=
er
> projects, to have a single, unified repository to describe all the hardwa=
re
> that exists in the world.

This! This is precisely why we don't move things out of the kernel.
The kernel is the location that has the most hardware support in the
world by far. It is not even close. Really, the only h/w missing are
things too small to run Linux. And with all that h/w support, comes
the people who understand the various classes of h/w. Those people are
not going to come along to a separate project. It would be more work
and there aren't any maintainers looking for extra work.

We already have a separate repository[1]. U-boot has recently
incorporated it and is happily (AFAIK) using it. It happens to be
generated from the kernel tree, but what doesn't work for you there?
I'm happy to discuss what it needs to work better.

> I am already working towards this goal by
> improving the dt-bindings and DT source files on the Linux repository
> whenever I can.

That's great, still plenty of work to do there no matter what
repository is hosting it.

> I must be quite late to make a topic suggestion but I'd be very happy to =
be
> able to attend to the maintainers summit. I've already registered for the
> Linux Plumbers Conference 2024.

This is probably not a maintainers summit topic. There's a DT BoF
scheduled already that Krzysztof is running and supporting other
projects is on the agenda already. I won't be there in person nor will
I be awake at the scheduled time.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-r=
ebasing.git/

