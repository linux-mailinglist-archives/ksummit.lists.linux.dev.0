Return-Path: <ksummit+bounces-1348-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E191227E
	for <lists@lfdr.de>; Fri, 21 Jun 2024 12:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3928528B9B1
	for <lists@lfdr.de>; Fri, 21 Jun 2024 10:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F46C171E7A;
	Fri, 21 Jun 2024 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jAXMQVV+"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48759171676
	for <ksummit@lists.linux.dev>; Fri, 21 Jun 2024 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966064; cv=none; b=ce8gAd/mwy/LgzcvRtVFFbYqLosk4ylwG6nXfeWYijy8DoY9yz6xs/i+KkYUAnmMmKDExQtiDOvAW/5cjm0tJmWK4SKuv5w5DYh6vg+Kto6hzFl32SSfGaf4Ne0EjMiAxwfI85v9SHaPjkUe872xlt4ZnAXg3OmSgBw8Z1OkBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966064; c=relaxed/simple;
	bh=SSeHh9kklPfPOkBvM8SO62iwOdE98d/i16mJy6LV0A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=g/+Su9eQAL/ORk1yQXS711xeMHa/9nhKRSKkv+Oq4/Ee3NgDyI8MdeE6PdMfLd3oPd3H727xhXQ6g6aqALX5iZgZNPieGm9OgLFKgOYzKvIQFrf4cM6yw+XITpT/gTdGAVLA0c18HYgB/b67mEE3fT2MMlwc6Cv1Xk8Wd4X8zig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jAXMQVV+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718966062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jicH10kgnAem7iqh38i51ASJS4+fEuc9yNE84SfuDqU=;
	b=jAXMQVV+07xtGzte3T6SahzIgHp/u80zc9dnq909lVOy3IjWitZbwWITvAud4djt5r6dSu
	pnAsQ9q92Hi6wtatBQIAjFov2lTodyrM5hD1zMofli56jrzDJoR3uEkLSGpk8Xfebv+w7t
	VlKthkLQPhc+XMBz4/V/LxRKSHwmnjk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-tT1DNj-9MiuwJaq5eiBjXw-1; Fri, 21 Jun 2024 06:34:20 -0400
X-MC-Unique: tT1DNj-9MiuwJaq5eiBjXw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57c6e28b151so1074805a12.2
        for <ksummit@lists.linux.dev>; Fri, 21 Jun 2024 03:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966060; x=1719570860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jicH10kgnAem7iqh38i51ASJS4+fEuc9yNE84SfuDqU=;
        b=Q6Fg+i21ruf25zFUraJp8q5gy1B9or1x5SR5XK9JFYYy5D6cma44SmhRExGAuMhU7h
         3W6rrTnO7i3xC7yDyxBbr8ZMaRnJIU/QrlyumadO6KbubGTrSyWcVgO3TLhoUbDoqm33
         WisEGQz6ulcmWhrx1lV/P4Nv8QST1jOej4X+R72uVa3iR4IIi/vMdNHk3Rg6irGmReUE
         2MbGvEQWlb/L6Ij5USlthT/niAolFyUoHDl7DBD9b0gZgzAZAmGIpH3u4FI5lwThas+l
         MxKy2hfran3jcvMDLu/V8otJikkWACkhSyF46PIOCGpvtVkNGc7ofTnqATnKVbs/PUBo
         HKyA==
X-Forwarded-Encrypted: i=1; AJvYcCWGFsuUoz87CckIoNxPgZkSRF6uq5u1xv7fCSPCUX26D3z0Fivl/V0Bsv7xXJMLuSCH6PLKFBdArlN7NuwUZdjeeGcTZALPMA==
X-Gm-Message-State: AOJu0YzVWb1Zg4LvbHxichnHKnGwqUe/S/xGIpjdwi4byMUUDj9gUdJQ
	k4iZrdmxC4LuZYejbwCp0BAkPwSo1jX/BRr6tHL/I3WkTmLmpJ/cruTqE2KjfdWeZZnMioyUhyN
	ck3laxRwkpxDCl8ngNE2CRzvEdTnF+PoITgjpy+ExNE1FzX1/kO5ubZY=
X-Received: by 2002:a50:ab52:0:b0:57d:50e:d76b with SMTP id 4fb4d7f45d1cf-57d07e2c81amr4589278a12.7.1718966059592;
        Fri, 21 Jun 2024 03:34:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+LHC14k3j9hWJnw+AA9J/VaHS6CBPN7VDxZhc4wOnEY9CizAlhrLs2CdLC8RK9nzYWVisQ==
X-Received: by 2002:a50:ab52:0:b0:57d:50e:d76b with SMTP id 4fb4d7f45d1cf-57d07e2c81amr4589250a12.7.1718966058632;
        Fri, 21 Jun 2024 03:34:18 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30562ee6sm747252a12.87.2024.06.21.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:34:18 -0700 (PDT)
Date: Fri, 21 Jun 2024 06:34:14 -0400
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
Subject: Re: [PATCH v2 2/2] Documentation: best practices for using Link
 trailers
Message-ID: <20240621062741-mutt-send-email-mst@kernel.org>
References: <20240619-docs-patch-msgid-link-v2-0-72dd272bfe37@linuxfoundation.org>
 <20240619-docs-patch-msgid-link-v2-2-72dd272bfe37@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240619-docs-patch-msgid-link-v2-2-72dd272bfe37@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 02:24:07PM -0400, Konstantin Ryabitsev wrote:
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
>  Documentation/process/maintainer-tip.rst | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> index 64739968afa6..ba312345d030 100644
> --- a/Documentation/process/maintainer-tip.rst
> +++ b/Documentation/process/maintainer-tip.rst
> @@ -372,17 +372,31 @@ following tag ordering scheme:
>  
>   - Link: ``https://link/to/information``
>  
> -   For referring to an email on LKML or other kernel mailing lists,
> -   please use the lore.kernel.org redirector URL::
> +   For referring to an email posted to the kernel mailing lists, please
> +   use the lore.kernel.org redirector URL::
>  
> -     https://lore.kernel.org/r/email-message@id
> +     Link: https://lore.kernel.org/email-message-id@here
>  
> -   The kernel.org redirector is considered a stable URL, unlike other email
> -   archives.
> +   This URL should be used when referring to relevant mailing list
> +   topics, related patch sets, or other notable discussion threads.
> +   A convenient way to associate ``Link:`` trailers with the commit
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
> +   You can also use ``Link:`` trailers to indicate the origin of the
> +   patch when applying it to your git tree. In that case, please use the
> +   dedicated ``patch.msgid.link`` domain instead of ``lore.kernel.org``.
> +   This practice makes it possible for automated tooling to identify
> +   which link to use to retrieve the original patch submission. For
> +   example::
> +
> +     Link: https://patch.msgid.link/patch-source-message-id@here
>  
>  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>  they just complicate automated extraction of tags.

Could you please add a hint on configuring git am to create these?

I think something like this in .git/hooks/applypatch-msg will work:

. git-sh-setup
perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://patch.msgid.link/$1|g;' "$1"
test -x "$GIT_DIR/hooks/commit-msg" &&
        exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
:

but I didn't actually try.

Thanks!

> -- 
> 2.45.2
> 


