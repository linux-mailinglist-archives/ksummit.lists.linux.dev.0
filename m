Return-Path: <ksummit+bounces-1324-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3B90E657
	for <lists@lfdr.de>; Wed, 19 Jun 2024 10:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03691C219D7
	for <lists@lfdr.de>; Wed, 19 Jun 2024 08:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7D37E766;
	Wed, 19 Jun 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhOB4/Cf"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B137D09D
	for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718787201; cv=none; b=L/dqDrkkNPUbQFzxYPklL30tmhAdqMcFhTAV672/Ay7nE9Yw3ZxFpCRBTEqux6GKmnLvn1N4y1AfrpYmzS7SJuPf/dBD8Ly+IgKLm5xSXcwMeekXvA0SH53RjMTHhobIMMMujNFG9O3HRlkNUGOc78+EnzJZa9Ms/Iak8qF7oKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718787201; c=relaxed/simple;
	bh=IdezUIbWDE3xzyG+PzI+wDMq0YgrgZe5gqeZ+0HgS+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fMg5rgom/Vb5RAZoPClcd8xniLligfEEHdZswtcuwBn1OCITk6fUL7cATz7rrLW+g6VqblnOAzyIjCs3rnNxmpLtyzQRF5TAoK3lTcnr0eqpznXb/ZdiqAin+2eheJtguFJ+yQpDxu0WhQ3ZsnCDhZ2CCWy/LT2NKK2wqMVWfKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhOB4/Cf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718787199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K13hk9JUFEctRDF4ygLdnIFTY/BaV/l3gZcTxg76ktQ=;
	b=RhOB4/Cfk6EIFNDhGydaEtKiZdx0YrGc4okBQQI0oBB8vNXG+ZrcKAjcOXcwjxR6qG7bqD
	ktR5lPVxm/f1aZkKT+YWxFVCq30quDtnBPUfIpFk92oqQlq7B7bMwyxieQbbm7spcijfaD
	+pZ3LEgkyW60nENf/k77AKtdYaJcu+Y=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-57gAuezAMO-CGnkOSzknpw-1; Wed, 19 Jun 2024 04:53:17 -0400
X-MC-Unique: 57gAuezAMO-CGnkOSzknpw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52cc6bdf698so1247339e87.0
        for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787195; x=1719391995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPS8SS6ennjQHF2kXRfpt1rl7sSsrfRS8VpYtUApKVM=;
        b=azGXQivEnSzbvynfrOttCEbQY2jj9WZmhroN+hzYovGC9QgeUIPTM5Lfnjvv091+Pq
         Uw5DNf7ut10nviL7iijQTqDf1QFdzrvayumpFE050XKaPkqiN4Lh6NE7sySffQRRZqNT
         PR2j443iSc3nnPlXDG70EaLAE5yKQsk4BQTOpan6NzdILbxjtfGcTqWF3DS8YYRULsLD
         dBa1HHoMCqKlAcb2O+oI1Ur467Qvwe+lV4lVpdNLUaIonoLgnWtu21Kl/jBmK9iMPMwu
         2QXvhLXSeJqv8bDgUuU5bqOSi1cSMHMDX0wcIhVsFaf77nh0lUv1icGH1dE/aFayzqap
         owow==
X-Forwarded-Encrypted: i=1; AJvYcCV5SJEh9Cw/qLBXVgG/KVXoqikB1v9xxscRTOdqOCngnUHxFyUXuwcuLtDKxexr6JSa+IvCxvQzCTnO80rvnCaDZB7efDlKyA==
X-Gm-Message-State: AOJu0YyiiBn0E3+cDXHJvqe4Wmu5cMuu37Via+qVBVOOlpXdqT1epO2X
	i7qwYyRENjqjJwcd3M1Fkz4xwRhY3IG6bxMQh1Iq1QukjAjBf3LBEDOA+v4xyhzyGRL/9UxqPBB
	Od/aohTpZw6tGpWIWnPLXkKIfgKoWhgau5CU8QW9+y/abg4b+gy0h0uA=
X-Received: by 2002:ac2:560a:0:b0:52b:bdfe:e0c9 with SMTP id 2adb3069b0e04-52ccaa558a4mr1248390e87.9.1718787195421;
        Wed, 19 Jun 2024 01:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE14pHNTd76/dq2L2pGAL/VAZ5zNFTz33QD2tvo9FUi+TaA3x0uzc0+wECZLIvEP2JDyTVymQ==
X-Received: by 2002:ac2:560a:0:b0:52b:bdfe:e0c9 with SMTP id 2adb3069b0e04-52ccaa558a4mr1248366e87.9.1718787194585;
        Wed, 19 Jun 2024 01:53:14 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282564dsm1699516e87.9.2024.06.19.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:53:13 -0700 (PDT)
Date: Wed, 19 Jun 2024 04:53:08 -0400
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
Message-ID: <20240619044810-mutt-send-email-mst@kernel.org>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
 <20240619043727-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240619043727-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:41:49AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jun 18, 2024 at 12:42:11PM -0400, Konstantin Ryabitsev wrote:
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
> > +
> > +     Link: https://patch.msgid.link/patch-source-msgid@here
> >  
> >  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
> >  they just complicate automated extraction of tags.
> 
> I don't really understand what this is saying.
> So when is msgid.link preferable to kernel.org
> And when is kernel.org preferable to msgid?


After reading the discussion in the commit log, it's now clearer what's meant
to me, but the Documentation patch itself does not really make it clear
IMHO.


It is also sad that instead of just setting
[am]
        messageid = true

one now apparently has to resort to funky scripts.
Any chance to at least document the best practices - what has to be done
as part of this patch to make git-am create these Link: things?


Thanks!


> 
> 
> > -- 
> > 2.45.2
> > 


