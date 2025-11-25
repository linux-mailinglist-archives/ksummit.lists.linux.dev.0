Return-Path: <ksummit+bounces-2644-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF27C851CE
	for <lists@lfdr.de>; Tue, 25 Nov 2025 14:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4B9135033B
	for <lists@lfdr.de>; Tue, 25 Nov 2025 13:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBD8322A1C;
	Tue, 25 Nov 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGkgoZvP"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA27320CA2
	for <ksummit@lists.linux.dev>; Tue, 25 Nov 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076199; cv=none; b=YMmoPyLckKz85xuACVw3G1bxCLs21lg9s/eiOLkDnlw5YsDhbwe8ng0ebu9xH0x4xBHxmYQP70kJQh8tH6DHMsNTpxqO6raZsAEjOPJICfvCS3XCVhetaT0OngORp3cGkonvMMspwc+8p9qIzpVqrkB9KH+JLeaHtkz87dho/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076199; c=relaxed/simple;
	bh=6t9Kl37s61tp9c3olKv2s7NlEriPDiNEThrlUnj/cmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iWOIbn4R+oAKLtkgTffzi13zaXKdXfQO3hDcDtn/fecQfsbUFOUL0hHYQM6DlEWKEKyMfvJDMQp+RvmvQ8QYYOCdvbYmVZYciKg0iFEcU5rxGonR4PILzittvEt0XKhtACbtPFOGETcd+eAfLzvogbMQXID6IVh1FJLM4HcoRQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGkgoZvP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764076198; x=1795612198;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6t9Kl37s61tp9c3olKv2s7NlEriPDiNEThrlUnj/cmo=;
  b=SGkgoZvPtr08c8raCw4kUbhYn+uW1nWqT0gqkaU1ZnA8MRQj58NmeLNY
   Xb1G6AAHxZC9y+C3/9d4ozwtXWrefSBednb03wDnGV4deknPebNz5wb7Z
   fg7W1c9GzYmdv4Tf9AHqdisDLKgd7kCJLVv4GdG+/TLdbeh32zawR5D9g
   3UAouMlJBf6/w9pgyDNwRNQSKLVCWDl8wxexz1nJeSywVL2zmhcFGOp52
   H3udcJMlaV9RWK8l+IfdXofXUBGMMKDIeN/lyomuBe3wqY/sx0AiZMzRD
   PU+0LVm5Kzv1d32l2lG/Oskoit5amP9lSoh1CyPL5yeUZtS1rL7Ytt5bX
   g==;
X-CSE-ConnectionGUID: 0CG3hxtxSVS0IMKcLHdTMw==
X-CSE-MsgGUID: driOWlBLT5WZyMcqn95snA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66169929"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66169929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:09:58 -0800
X-CSE-ConnectionGUID: 6mH1ts/tRgu3zNKVmoZqRg==
X-CSE-MsgGUID: gtvZBVQATm2o+x0zCmkDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="197116274"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.213])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:09:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
In-Reply-To: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Date: Tue, 25 Nov 2025 15:09:52 +0200
Message-ID: <063cb6d370f94088d5e2a385acf14d96f06e6686@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 18 Nov 2025, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> For myself I do find some value in the C89 declarations at the
> beginning of the block for readability, so I'm happy to relax the
> mixing rule to cases where it's strictly necessary and require
> documenting in the comment what the necessity is.

I think I've seen an increase in patches using non-pointer const local
variables. No metrics, just a gut feeling.

	const int foo = bar + 5;

I haven't really decided whether I like that or not, and subsequently I
have neither encouraged or discouraged that usage. I don't think we have
any style guidance on that either.

Anyway, more const usage like that would also benefit from declaration
and initialization at a later point when the initializer value is
available, if it's not at the beginning.

BR,
Jani.


-- 
Jani Nikula, Intel

