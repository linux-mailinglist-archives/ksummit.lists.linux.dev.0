Return-Path: <ksummit+bounces-1471-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB493BF17
	for <lists@lfdr.de>; Thu, 25 Jul 2024 11:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85777B21C30
	for <lists@lfdr.de>; Thu, 25 Jul 2024 09:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA44197A7C;
	Thu, 25 Jul 2024 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRw13MrO"
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F2197559
	for <ksummit@lists.linux.dev>; Thu, 25 Jul 2024 09:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721899618; cv=none; b=D85qUd5lkviaBiwI6a+RJMMP2eRR0PLVffQ6f9+IilC45b4WuPxida+vBPHMdgHeCZcpO3kvEouLQc7MmPaPD6HsBY1bCjsJvm7CDsdMLyMzsPSozzlmYfjnajInW+b4co/F4gTSlEcpyK9W1+OJ5sNWh/QLrM7lnZ7WdRUigT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721899618; c=relaxed/simple;
	bh=GxfeIqEMhSlZx5VfQdJ/o64sqUdkOvLZVRFcbIn5WlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWCAIqkfk5S1nQyyhesa34OsjDr4M6cDVO60HTD8iP0ij1s5T2b9ej5p/XMWs1VFEPD5VqsXXogQ67n62Py/77r01VNpfTHtPNDi2LYItpc0mROSbtbr96tUrQgmmlrLmWtO+8Tvx0q56vfnjSU7Q4e58MInR6pphKGOAslNxfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRw13MrO; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-49291b02e20so239217137.2
        for <ksummit@lists.linux.dev>; Thu, 25 Jul 2024 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721899616; x=1722504416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxfeIqEMhSlZx5VfQdJ/o64sqUdkOvLZVRFcbIn5WlU=;
        b=mRw13MrOHeGeY2lQHFjecfY/AprFQAm3k0Cwg28xBVMfqVuBJwAZ/RGVA3n+MR2N/b
         QklNZ0N/c/dqngYpx5wb4hLAyJiBrqNiPx9CIxoEWK5ojtsdjG/dQ6YnD8ClIdc4z5KB
         /0v3Na+L1oebrf6s/nlVOEdWBgLKiw1hV01/OhFng4qQSZxxPM7avFj6LWBxBqbyoLqT
         jch4Wn0xjxmTiBvn5eL/kVCMKooQjdmz5DYT6BG3D87dVeTSkj3AzY6XZOju99P6dPXN
         M1Zh0o45iNOVQUxWDPm59AjzrMWfXtJQ2WcBZu2JkS78eZaSRSIp7XQX5Z4As1hIfo7x
         P8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721899616; x=1722504416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxfeIqEMhSlZx5VfQdJ/o64sqUdkOvLZVRFcbIn5WlU=;
        b=wt/1F5wDwrqHiztCDRThE+w4mx8LVUgVdGgp24LT/oWSZGBo08F9bCGsbZOC+KSJnz
         QhnVTJqC8OeELz431WZXa412m3YCvhPXP0QhcDZJw1GxEkih4P0WL6+E8ED8yBX4qGd2
         EeG7gjLtdPzoXrZ0jxb7n73ooDA241KE1wLMdEGi/WlAaYbOkGzMVdlns6e65mjLlTv2
         o5TEIszFDbyS+EoQ4gW+QuNS7EZ/O9n3VAwO0FXhfzgNbjiwHoE6cOMiCl89nIgEmvqO
         Lrhfmw7DTw4YlPzO9coOLzPezOCy77Jf988Z2wxaIG1LwZ+VpebwSoODBKz02DIepOId
         awtA==
X-Forwarded-Encrypted: i=1; AJvYcCULSGslLfFeixdwKRrpNJWCvW0umqTCWHXAFd9uf6wuWb0wmBKyt5R6NqMEpMEUu/aGTaIBl5HBYRhugAk8EQ/PDOjj3taRhg==
X-Gm-Message-State: AOJu0YzKuvn8ksWpmWTA6hBHV/zum5lw+MKXTHM42iOrL7LqOf/tekZ5
	EDSxrZFs00d88F5yYh5bAtmMRj9rZBFD1gkCwUkXTpyJkE4IODBcLAI/Fzl24ENF9kaL5tyvQbO
	tNM4Y47S4w8vCyL3Ia8QmgJbnftA=
X-Google-Smtp-Source: AGHT+IGbHyep8xJMWEks+3bmG2i9KzcJWzZdjHeXmEmYSyDNJX/F+ls2Zg1ZbMJP/MznJjE1fg7/QYQz9ZGxRYkjnbg=
X-Received: by 2002:a05:6102:5709:b0:492:ad30:b6e8 with SMTP id
 ada2fe7eead31-493d9a83cc7mr1593183137.3.1721899615871; Thu, 25 Jul 2024
 02:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <nycvar.YFH.7.76.2407231320210.11380@cbobk.fhfr.pm> <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com>
In-Reply-To: <20240724200012.GA23293@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 25 Jul 2024 11:26:38 +0200
Message-ID: <CAPybu_0SN7m=m=+z5hu_4M+STGh2t0J-hFEmtDTgx6fYWKzk3A@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jikos@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:02=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>
> While "userspace drivers" often cause allergic reactions, I think I
> won't cause a controversy if I say that we are all used to them in
> certain areas. My heart rate will increase if someone proposes replacing
> a USB webcam driver with a libusb-based solution, but I don't lose sleep
> over the fact that my GPU is mostly controlled by code in Mesa.

I think the key point here is that USB webcams follow a standard, and
GPUs don't.


>
> What I get from the discussions I've followed or partcipated in over the
> years is that the main worry of free software communities is being
> forced to use closed-source userspace components, whether that would be
> to make the device usable at all, or to achieve decent level of
> performance or full feature set. We've been through years of mostly
> closed-source GPU support, of printer "windrivers", and quite a few
> other horrors. The good news is that we've so far overcome lots (most)
> of those challenges. Reverse engineering projects paid off, and so did
> working hand-in-hand with industry actors in multiple ways (both openly
> and behind the scenes). One could then legitimately ask why we're still
> scared.


It would be great to define what are the free software communities
here. Distros and final users are also "free software communities" and
they do not care about niche use cases covered by proprietary
software.
They only care (and should care) about normal workflows.


>
> I can't fully answer that question, but there are two points that I
> think are relevant. Note that due to my background and experience, this
> will be heavily biased towards consumer and embedded hardware, not data
> centre-grade devices. Some technologies from the latter however have a
> tendency to migrate to the former over time, so the distinction isn't
> necessarily as relevant as one may consider.
>
> The first point is that hardware gets more complicated over time, and in
> some markets there's also an increase in the number of vendors and
> devices. There's a perceived (whether true or not) danger that we won't
> be able to keep up with just reverse engineering and a development model
> relying on hobyists. Getting vendors involved is important if we want to
> scale.

If we want vendors involved, we need to build an ecosystem where they
feel invited.

We should not take as hostages our users and impose rules on how they
should build or even sell their product.

>
> Second, I think there's a fear of regression. For some categories of
> devices, we have made slow but real progress to try and convince the
> industry to be more open. This sometimes took a decade of work,
> patiently building bridges and creating ecosystems brick by brick. Some
> of those ecosystems are sturdy, some not so. Giving pass-through a blank
> check will likely have very different effects in different areas. I
> don't personally believe it will shatter everything, but I'm convinced
> it carries risk in areas where cooperation with vendors is in its
> infancy or is fragile for any other reason.

We control what is accepted and what is not. We just need clear rules,
to avoid regressions like:
- For areas where there is a standard (NVME, UVC,...) most of the
drivers must be in-kernel, and use generic system calls.
- For areas with no standard, custom system calls are allowed, and
some part of the driver can be in userspace.
- To land a driver, there must be a full open source stack capable of
using it for standard use cases.
- If there is an established open source stack (mesa, openVINO,
libcamera...), the open source stack must be based on it.
- Vendor passthrough mechanisms are allowed for niche use cases or
development/experimentation.

I believe those rules are already in place in some subsystems. We just
have to agree what rules should apply to all the kernel by policy.

We can agree that this kind of discussion is done better face to face.

Regards!



>
> Finally, let's not forget that pass-through APIs are not an all or
> nothing option. To cite that example only, DRM requires GPU drivers to
> have an open-source userspace implementation to merge the kernel driver,
> and the same subsystems strongly pushes for API standardization for
> display controllers. We can set different rules for different cases.
>
> --
> Regards,
>
> Laurent Pinchart
>


--
Ricardo Ribalda

