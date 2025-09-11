Return-Path: <ksummit+bounces-2338-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9105DB531B9
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48015583A3F
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E7E3128D4;
	Thu, 11 Sep 2025 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdnxZzVV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A370E552
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592417; cv=none; b=htYnkS68GKiWKZmbk/dPl3eeLig7jjOvix3kcAFJbXCDQRXraHgpe0U/h7PfDk6889oymuI75OkEcg6h5vYz+LJQvqat/MPMeIZaBOnLJVoZBMyMVQVg5aoFK0ptcscNUfHUuU6+CumLg17C6l4r1afKbfNEfaicxoD7Xtzge9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592417; c=relaxed/simple;
	bh=SW5PITxjcO7CAbSYOHcLe3qAhfTI19Ao9OVpaSpISfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=keO+8gUbA/+skeRUTodPgA1VtRJKZh0lEg/8XG7VooHzazdhQpdwSq+KaopyalptLF/PXt81txWlLxyP8AIeV+/jGK1sKOZY2+8a2V0E5WeeAeam5OjmwjywJeD0TsOL5YMGDH2S5b8yDjzmBu8uMnFjoELJShoNZJOtPEgqWPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdnxZzVV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80823C4CEF0;
	Thu, 11 Sep 2025 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757592417;
	bh=SW5PITxjcO7CAbSYOHcLe3qAhfTI19Ao9OVpaSpISfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qdnxZzVVLgurEUIkBPypdalcu9gjYTSvyQ9XqkSXKGESmGaGjFOXKpoTpLNDX2igg
	 9oj7mhxlBU9UrPb9shzMRgSbRUnwL82/H0bXfXkxgzUOzy+eZ4hus75uocQXQn/rq6
	 J5Oi3yGldLmPoewyHRCcmuc6eHJz4l3oQ99cvz2I2AnCW94yLgUCsIByFrGBoBi9jv
	 LrsaC+9J1Bm6O7sc5tk0lxo0XtazXdiDv7YZeJnWAVJVyNWnZbpHf/EE1OAIH5L06L
	 bhhV53vw9XoVrLDsRXJkSgi9osdbNJAxNwRYgZVxii3eymFYnPI2BTCwF5VIM2aTby
	 29Yj2LtGuJTaQ==
Date: Thu, 11 Sep 2025 14:06:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why maintainers
 hoard them in backpack)
In-Reply-To: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
Message-ID: <81n4979o-0969-q3o1-6n66-979668n0on47@xreary.bet>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Sep 2025, Krzysztof Kozlowski wrote:

> Identifying the patches
> =======================
> There are two cases here for patches committed by sub-maintainers, but
> never fed to next:
> 1. The upstream maintainer took them via pull request.

Hm, why would that imply that they never make to linux-next though?

I always keep multiple topic branches that are queued for upcoming merge 
window, and it doesn't really matter whether they came in from pull 
request of whether I have created it myself.

And all those branches then merge into for-next, which linux-next is 
consuming.

I don't see how the fact that (part of) topic branch came in via pull 
request would make any difference ... ?

Thanks,

-- 
Jiri Kosina
SUSE Labs


