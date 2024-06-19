Return-Path: <ksummit+bounces-1325-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63E90E68A
	for <lists@lfdr.de>; Wed, 19 Jun 2024 11:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB0541F236C3
	for <lists@lfdr.de>; Wed, 19 Jun 2024 09:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B157F7CA;
	Wed, 19 Jun 2024 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxUESXmH"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720DB7E78E
	for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788124; cv=none; b=PoeQzqanbTegefA5K3R10ghhrqGG6Av5IVfYVckQnvEFWP7ptah4PZrSAlWlEydzL7jvsI7nwM+jBgzrdEHVb9rGzVOgepGiRu8uHsHFhhukSQdhz6YMJ+4Gk85Bk02b5EhaCSJ+qrQqif2ClpvNkWVIz91HXW1CKjtehu+KRFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788124; c=relaxed/simple;
	bh=l5ExirGQyRAtIOk0NhDOS9E3Rwzt/v5G6frBd1Eto7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ewrMNd/6xcdL8OHFxzJfJA3J9nWj58qq8q9pIA4j5P4XD/HTS2ixRMn1mBG5892SpRawYXk5ukOPjkWIeaQUuoMuqe39TLj4hSBf1WlWzAYmlIB0E99xAWMqan5bUx+gJ1GZwCGbB3oEjlpmqKjDriH6vmxPaK7MipATJNgO6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxUESXmH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718788121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6etdIHf+vLceRRGRQM9DwQ8BkpeTzkHdW5ywbuRdZ8=;
	b=YxUESXmHoEKmvjteEhnW1RQ0Ii71b5H9qCKXN9LLlZUUFvnP6OoHo88kJYaLLVt87FJJA7
	6+lOklSuX1Kfy8Y73Ocv4eYhKBpd8H0BGtzE9qEwAbQ9PiEUMvs6ITqGNPFjyWhGY7x+Dw
	8yR/ihi71uBdvA6pFxW4hT8iz2eZ4BQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-moUpYNNINoGlkbHpXN99SA-1; Wed, 19 Jun 2024 05:08:40 -0400
X-MC-Unique: moUpYNNINoGlkbHpXN99SA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4247047e74aso15850285e9.3
        for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 02:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718788119; x=1719392919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6etdIHf+vLceRRGRQM9DwQ8BkpeTzkHdW5ywbuRdZ8=;
        b=hyVddQRc8mB5Ueu1Lj3BNQnsAXw1oYRCV2m+9K5lmXlrv9Xmfgp58I5y2BgO0HVITY
         SWupLN7guB/EIliZ2oXslhtrbeYK3muoiqYfm8EPZDCauL4EN6q2QBaq4nlFRM5YWsyR
         sK22jTcuJWIQ9IrQxon9bcsf3+5wzKbwlIP/Ecjff2vZWGvqrrpz62/7k9eKpuO3yK1L
         V1k+cDRlIABcsKCobrHm0RVPDuwww5onwOJ8AbDoj7SOPnVnp52eEOU3umdeT6zUP8Qj
         WObB1jHISb4uACRv0ry9d20UAtHqrocagtE6O+DxzzkdNbdfNeUxQOqGLTyaqCCj3zpy
         mkzA==
X-Forwarded-Encrypted: i=1; AJvYcCVfnu1c5PRW9ZHNBxKxYd2gMBuJr0fvGEYeAyxHZGaMUIrH3Q68W+1eomCqrZW7fM8e678GELWIKQTASFHiN3QwiIdwBAq53w==
X-Gm-Message-State: AOJu0YzW1wcag7J2BwYlxHsBV3BnZ/1wInJ+E3FHllOE+7mt0R2uU5bz
	p1JGsWO8mI7neQrjOI8ncZ8rEJr9xES2uXIG82mzRBaw+zrYmCVcKXl0NP18PO+RLjv8FL18Qda
	NPCHYfuXEmRF55AOSLqhVQWffpVrM0Thmmgv50Zc//nl9BonFCvBlPVs=
X-Received: by 2002:a05:600c:214c:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-424750796a4mr16406185e9.7.1718788118662;
        Wed, 19 Jun 2024 02:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDmHDeUKSzvwFZloG+Wasg47pkCbBVp7dtO2iM2/FT/vYQ18GUuBHQi2kxayKUmsy2s8xgdg==
X-Received: by 2002:a05:600c:214c:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-424750796a4mr16405765e9.7.1718788117895;
        Wed, 19 Jun 2024 02:08:37 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm260339195e9.28.2024.06.19.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:08:37 -0700 (PDT)
Date: Wed, 19 Jun 2024 05:08:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <20240619050715-mutt-send-email-mst@kernel.org>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
 <87r0ctfh93.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87r0ctfh93.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 11:50:48AM +0300, Jani Nikula wrote:
> On Tue, 18 Jun 2024, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > Based on multiple conversations, most recently on the ksummit mailing
> > list [1], add some best practices for using the Link trailer, such as:
> >
> > - how to use markdown-like bracketed numbers in the commit message to
> > indicate the corresponding link
> > - when to use lore.kernel.org vs patch.msgid.link domains
> >
> > Cc: ksummit@lists.linux.dev
> > Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> > ---
> >  Documentation/process/maintainer-tip.rst | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> > index 64739968afa6..57ffa553c21e 100644
> > --- a/Documentation/process/maintainer-tip.rst
> > +++ b/Documentation/process/maintainer-tip.rst
> > @@ -375,14 +375,26 @@ following tag ordering scheme:
> >     For referring to an email on LKML or other kernel mailing lists,
> >     please use the lore.kernel.org redirector URL::
> >  
> > -     https://lore.kernel.org/r/email-message@id
> > +     Link: https://lore.kernel.org/email-message@id
> >  
> > -   The kernel.org redirector is considered a stable URL, unlike other email
> > -   archives.
> > +   This URL should be used when referring to relevant mailing list
> > +   resources, related patch sets, or other notable discussion threads.
> > +   A convenient way to associate Link trailers with the accompanying
> > +   message is to use markdown-like bracketed notation, for example::
> >  
> > -   Maintainers will add a Link tag referencing the email of the patch
> > -   submission when they apply a patch to the tip tree. This tag is useful
> > -   for later reference and is also used for commit notifications.
> > +     A similar approach was attempted before as part of a different
> > +     effort [1], but the initial implementation caused too many
> > +     regressions [2], so it was backed out and reimplemented.
> > +
> > +     Link: https://lore.kernel.org/some-msgid@here # [1]
> > +     Link: https://bugzilla.example.org/bug/12345  # [2]
> > +
> > +   When using the ``Link:`` trailer to indicate the provenance of the
> > +   patch, you should use the dedicated ``patch.msgid.link`` domain. This
> > +   makes it possible for automated tooling to establish which link leads
> > +   to the original patch submission. For example::
> 
> Mostly highlighting my own ignorance here, but s/provenance/origin/
> would've felt more obvious to me, as a non-native speaker.
> 
> BR,
> Jani.

Or even "origin (message id)" to be very explicit.






> 
> > +
> > +     Link: https://patch.msgid.link/patch-source-msgid@here
> >  
> >  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
> >  they just complicate automated extraction of tags.
> 
> -- 
> Jani Nikula, Intel


