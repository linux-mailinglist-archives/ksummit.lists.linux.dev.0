Return-Path: <ksummit+bounces-1323-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8590E648
	for <lists@lfdr.de>; Wed, 19 Jun 2024 10:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5141F22A88
	for <lists@lfdr.de>; Wed, 19 Jun 2024 08:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3039D7F7D3;
	Wed, 19 Jun 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6VA2mTw"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9A27F487
	for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718787058; cv=none; b=OjWKRki+RJFEEjZA5/DAtYLsDcj18XdVK+bsao3Jks4io6XqdsT97avE+YUlVJ1izfHZ8J26a1QxJ/ICtrqoXWgAHN8CthAiC1zQAtsDbdvOSPoZwqjEpisGhQaSdydTzrRyLASn5DfmbJu3QBoQHf50k0OqOv07JlI27saEt9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718787058; c=relaxed/simple;
	bh=9pX7wwOZEam6xxkbsMASbU9Ysh/sQPw19k9MrZhyxq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bU8WUP94wCOf5aIbceL/GY89sj8C1HldRFM0iy5YQfQrd9K4DogFFVdM0ITVUyu7wjSu5QtEAnv/SsipRZrW+Kf1np3QBFDCBdr8D7NmGwzPaK+acWvRvi98ls0iD7+FVYGSEG3VSLlj2hthaKVCOwH09akoJXnIM3rbIVOoGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6VA2mTw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718787057; x=1750323057;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=9pX7wwOZEam6xxkbsMASbU9Ysh/sQPw19k9MrZhyxq8=;
  b=a6VA2mTw3e776bH1pQo/MHUWqhtJ02yU5EfU47s82VhSFJ7u/+ww90g9
   kw8tM9KH0OvnZ2tQAfD1xgkkNkkaIsKA0oRDTx0dNG1CaXOh/M5coPWRi
   CKCcbB1wTArPyzvDW3Yrcu/N3wXyCpBBgup8QhqrC5VmTcpQPaqsyg/EQ
   Ij8I1Jir04k+vmHoA1n93JcZYzxFDRKBub3M26WqE28388G1MCkExfzxF
   LXJ35w78P9xFwyyg3tYPSx1euuBpgKLli25zkEkWtABp3Cca1UCN6/2eH
   wAF8rFNpCbP54uBEZf3G8J5w1Pj0vCLRuClBf5VicvUPS/L0Q6wgEN2An
   A==;
X-CSE-ConnectionGUID: rToCmvpgT4eN6oA2tAaE3w==
X-CSE-MsgGUID: v4/XCr8QQqyvVeBOAOIDzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26392632"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="26392632"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 01:50:56 -0700
X-CSE-ConnectionGUID: IC5YYstLQ+ikQtZG/ZzbJA==
X-CSE-MsgGUID: 7cNsuLtiSUmLiLOmBS07yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="42556513"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.249])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 01:50:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Date: Wed, 19 Jun 2024 11:50:48 +0300
Message-ID: <87r0ctfh93.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 18 Jun 2024, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
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

Mostly highlighting my own ignorance here, but s/provenance/origin/
would've felt more obvious to me, as a non-native speaker.

BR,
Jani.


> +
> +     Link: https://patch.msgid.link/patch-source-msgid@here
>  
>  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>  they just complicate automated extraction of tags.

-- 
Jani Nikula, Intel

