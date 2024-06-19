Return-Path: <ksummit+bounces-1322-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8F90E62E
	for <lists@lfdr.de>; Wed, 19 Jun 2024 10:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB2F1C20D1B
	for <lists@lfdr.de>; Wed, 19 Jun 2024 08:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADA07E567;
	Wed, 19 Jun 2024 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ws3vWYgC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654017D07E
	for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718786517; cv=none; b=sJxbSL54jFUFoLV8gEG3dCfWY7GHTDsxPMwPSNbcnX6vaaN/xzaFQwSUvvTs7CSIodVXAlrqsYFIAG4nwZue29WS9qjWmPFcnVne5qaiwKndudiYUOSxPlb6C2oOPNYiRYdAOiJxGsJjNcGh/75pX181wTvjwXvkhn5TYaTzdpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718786517; c=relaxed/simple;
	bh=VFHhtVIu3OC6M17iJ+jcXGqR7rvztUjukDv9XShGhPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nGVZRVzLENeZZyHNu7APQBg/lvK8sNWvdlQ7UkF2swASmeVlyCTv9oANoIm6sMkleBI3SEOWxgrRqA2Ta0i5isO73mFFmuq7F3fez1n9Omjzee85q9qdKEsm8SaAeVDP+SFTzUuynHtJd13m4hvRkE9sp6aGLcZRkvnuCu5CReo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ws3vWYgC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718786515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n/xtlsAzzRX0ZnO77G6EPTzyNF/fCs7h82LNhhhefZA=;
	b=Ws3vWYgCJXWKQdanCJatbJe24bQCnpdtsH5o1wdAeaAL5XCYUWgqcPvUkMNTmX5Cq6ytOo
	C8ZEWodUZzJyXxFKymBf1robdGXwAsuZlc9dPpo6w0mo47Jp/I20U8Bbtyt6Gmfgm1uax9
	JalOM+oLysW1Hv5xXr6/w76ljrlOMoU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-KbsVC6wTM3OHQ8yIjPVp_Q-1; Wed, 19 Jun 2024 04:41:51 -0400
X-MC-Unique: KbsVC6wTM3OHQ8yIjPVp_Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-362763f8d2eso674776f8f.3
        for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 01:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718786510; x=1719391310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdxpcAnJIttE7xF3rf60XtSKDuT7zxfz6ipOIlDZ/C4=;
        b=aybyH0viQ+QgbkD4F+DOabijTz2e3TazCq1+zk5GKO0qYy+u64NmkldYhIhXAA0YqO
         I9F8RN74nZpPdviV6ctWSd3IXNCTZsR8bxhosGfRtYyi63QpTbMqjrEGkV/yufEq8w1F
         ZMqRBiCgBL6iLent/2aUtOtnK4b1+paQi6bSJbVoqhRb5rlLKK/Od6qEso4bkc9SLzyt
         rbmlcFdvJrw51FOOVIDnyB1m98m4YA1U3uNyPOn6V3+rJcvZSUxDT+a5gjmhRm7d+NlV
         0VY5l2PP5+Au3onhdUUw/QplAvh1fkxk97wy6kniDXaWz1h1TLeSyDNbWyasPr/DOYfk
         e57A==
X-Forwarded-Encrypted: i=1; AJvYcCX6iCyxKu38O5yUA8HvLeGr1TjkRE7U4i5+wAQtHuB7RLIdthHldoyy4rCEewux8IweTtzwv9iHIC3hNdqRaOQL73Gy9Ld+ig==
X-Gm-Message-State: AOJu0YziIxVsDadVUSDDYalpc4NIeiBVr+lLbmruIxm5BseNnm26zJev
	D5exR+ZLT/rO0K9/dEQ7UFxPJnbMxRA/lWbPVllA9eFmkt6XXrKWUSSwwT/FK5TG/naiGAKcnXL
	gZ3QATyjkZVYlS9F3hDGp9otJTwbsNIz4NPN8MRw1xn9LO3yCh4mf95M=
X-Received: by 2002:a5d:408d:0:b0:360:7829:bb93 with SMTP id ffacd0b85a97d-363177a3a72mr1642371f8f.21.1718786509771;
        Wed, 19 Jun 2024 01:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmonG/1oENmgMotUOYhNKtoTPMrBWuRz2ayevhgGPlMbNtdCXnZPDcBQKyrmKw0SKJQvaQlg==
X-Received: by 2002:a5d:408d:0:b0:360:7829:bb93 with SMTP id ffacd0b85a97d-363177a3a72mr1642352f8f.21.1718786509061;
        Wed, 19 Jun 2024 01:41:49 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-363bd4668aasm730542f8f.48.2024.06.19.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:41:48 -0700 (PDT)
Date: Wed, 19 Jun 2024 04:41:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <20240619043727-mutt-send-email-mst@kernel.org>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 12:42:11PM -0400, Konstantin Ryabitsev wrote:
> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
> 
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains
> 
> Cc: ksummit@lists.linux.dev
> Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
>  Documentation/process/maintainer-tip.rst | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> index 64739968afa6..57ffa553c21e 100644
> --- a/Documentation/process/maintainer-tip.rst
> +++ b/Documentation/process/maintainer-tip.rst
> @@ -375,14 +375,26 @@ following tag ordering scheme:
>     For referring to an email on LKML or other kernel mailing lists,
>     please use the lore.kernel.org redirector URL::
>  
> -     https://lore.kernel.org/r/email-message@id
> +     Link: https://lore.kernel.org/email-message@id
>  
> -   The kernel.org redirector is considered a stable URL, unlike other email
> -   archives.
> +   This URL should be used when referring to relevant mailing list
> +   resources, related patch sets, or other notable discussion threads.
> +   A convenient way to associate Link trailers with the accompanying
> +   message is to use markdown-like bracketed notation, for example::
>  
> -   Maintainers will add a Link tag referencing the email of the patch
> -   submission when they apply a patch to the tip tree. This tag is useful
> -   for later reference and is also used for commit notifications.
> +     A similar approach was attempted before as part of a different
> +     effort [1], but the initial implementation caused too many
> +     regressions [2], so it was backed out and reimplemented.
> +
> +     Link: https://lore.kernel.org/some-msgid@here # [1]
> +     Link: https://bugzilla.example.org/bug/12345  # [2]
> +
> +   When using the ``Link:`` trailer to indicate the provenance of the
> +   patch, you should use the dedicated ``patch.msgid.link`` domain. This
> +   makes it possible for automated tooling to establish which link leads
> +   to the original patch submission. For example::
> +
> +     Link: https://patch.msgid.link/patch-source-msgid@here
>  
>  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>  they just complicate automated extraction of tags.

I don't really understand what this is saying.
So when is msgid.link preferable to kernel.org
And when is kernel.org preferable to msgid?



> -- 
> 2.45.2
> 


