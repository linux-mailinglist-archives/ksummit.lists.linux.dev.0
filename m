Return-Path: <ksummit+bounces-685-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52A557676
	for <lists@lfdr.de>; Thu, 23 Jun 2022 11:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA02B280BFE
	for <lists@lfdr.de>; Thu, 23 Jun 2022 09:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83D41C2F;
	Thu, 23 Jun 2022 09:18:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD31C2E
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655975936; x=1687511936;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=+EoNTYBmP4Qmy/Jgn2sUeikX8Or5ovwt3MLRk4YVnCY=;
  b=LHGrizSs7tXEpj/V23Jtc5a+XMRvVpTjHKKKU3fSjcj0TID894ehb7dz
   rdO9hd4Q/W78zoFZYNAKAVWnxvkfnR8UdUKd1M9Rxs23a1gv+IdlWLtdG
   S8eRAdVOEmywSUXzeywZnxVxoO71r7YOGd7PUw0/+J/0PptWCUKq82JK9
   P7Ad+ubvjtaXKj4KkiGarlfE2o5FxnKq1gkJ6TechLVdJx3ha+s1J6AsK
   0J5CupMUguDvdmCY5H/n0c8SrPitdlLx1uqoAf0yyZnHuGRwun2tqRhZL
   Hji1J8kM2CETxuD580eUTvtu/qbRxn7plfawoDbLoNpxa2JliOd5Z9DdM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269395251"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="269395251"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 02:18:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="644649454"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost) ([10.252.61.112])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 02:18:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <20220618092447.5ebed314@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
Date: Thu, 23 Jun 2022 12:18:50 +0300
Message-ID: <875ykrrb45.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 18 Jun 2022, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> The big missing feature on Sphinx itself is with regards to per-C-type
> domain. So, if we have one struct and one function both called "foo",
> the cross-references will be broken. This issue is known since Sphinx
> 3.1, and there are already patches fixing it since then (I remember
> testing them) but, up to today, the Sphinx upstream patches meant
> to fix it weren't applied yet (as far as I can tell).

https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#namespacing

Integrating that needs to be done carefully, though, to not make a mess
of it.

> One thing that probably be solved on a different way is to have
> a better solution for things like:
>
> 	Functions for feature 1
> 	=======================
>
> 	.. kernel-doc:: include/some_header.h
> 	   :doc: Feature 1
>
> 	.. kernel-doc:: include/some_header.h
> 	   :functions:
> 		func1
> 		func2
>
> 	Functions for feature 2
> 	=======================
>
> 	.. kernel-doc:: include/some_header.h
> 	   :doc: Feature 2
>
> 	.. kernel-doc:: include/some_header.h
> 	   :functions:
> 		func3
> 		func4

Yeah, currently that leads to parsing the header four times by
kernel-doc the script. The solution would be to finally convert the
script to a proper python Sphinx extension that can do caching. (This is
how it works in Hawkmoth, FWIW.)

> Perhaps we could change Kernel-doc in a way that doing just:
>
> 	.. kernel-doc:: include/some_header.h
>
> would be enough.

The order in nicely flowing documentation is not necessarily the same as
the order in nicely flowing source code. I expect it to be much more
acceptable to tweak the rst to achieve this than to do source code
rearrangement to generate nice documentation.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

